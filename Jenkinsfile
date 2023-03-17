def isHarnessChange(harnesses) {
    def harnessLabels = harnesses.collect { "harness-${it}".toString() } << 'harness-all'
    return !env.CHANGE_ID || pullRequest.labels.size() == 0 || harnessLabels.any { pullRequest.labels.contains(it) }
}

pipeline {
    agent { label 'linux-amd64' }
    environment {
        COMPOSE_DOCKER_CLI_BUILD = 1
        DOCKER_BUILDKIT = 1
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
        parallelsAlwaysFailFast()
    }
    triggers { cron(env.BRANCH_NAME ==~ /^\d+\.\d+\.x$/ ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Quality Checks') {
            steps {
                sh './build'
                sh './quality'
                milestone(10)
            }
        }
        stage('Build and Test') {
            parallel {
                stage('1. PHP, Drupal, Akeneo, Wordpress') {
                    // Choose a different agent to our "main" one
                    agent {
                       docker {
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    when {
                        beforeAgent true
                        expression { return isHarnessChange(['base', 'akeneo', 'drupal8', 'wordpress']) }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                                sh './build'
                            }
                        }
                        stage('Quality Tests') {
                            environment {
                                TEARDOWN_ENVIRONMENT = "no"
                                TEST_MODE = "quality"
                            }
                            steps {
                                sh './test php static'
                                sh './test drupal9 static'
                                sh './test drupal8 static'
                                sh './test akeneo6 static'
                                sh './test akeneo5 static'
                                sh './test akeneo4 static'
                                sh './test wordpress static'
                                sh './test php dynamic'
                                sh './test drupal8 dynamic'
                                sh './test akeneo6 dynamic'
                                sh './test akeneo5 dynamic'
                                sh './test akeneo4 dynamic'
                                sh './test wordpress dynamic'
                                sh './test php dynamic mutagen'
                                sh './test drupal8 dynamic mutagen'
                                sh './test akeneo6 dynamic mutagen'
                                sh './test akeneo5 dynamic mutagen'
                                sh './test akeneo4 dynamic mutagen'
                                sh './test wordpress dynamic mutagen'
                            }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('PHP') {
                                    when { expression { return isHarnessChange(['base']) } }
                                    steps { sh './test php static' }
                                }
                                stage('Drupal 9') {
                                    when { expression { return isHarnessChange(['drupal8']) } }
                                    steps { sh './test drupal9 static' }
                                }
                                stage('Drupal 8') {
                                    when { expression { return isHarnessChange(['drupal8']) } }
                                    steps { sh './test drupal8 static' }
                                }
                                stage('Akeneo 6') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo6 static' }
                                }
                                stage('Akeneo 5') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo5 static' }
                                }
                                stage('Akeneo 4') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo4 static' }
                                }
                                stage('Wordpress') {
                                    when { expression { return isHarnessChange(['wordpress']) } }
                                    steps { sh './test wordpress static' }
                                }

                                stage('PHP Dynamic') {
                                    when { expression { return isHarnessChange(['base']) } }
                                    steps { sh './test php dynamic' }
                                }
                                stage('Drupal 9 Dynamic') {
                                    when { expression { return isHarnessChange(['drupal8']) } }
                                    steps { sh './test drupal9 dynamic' }
                                }
                                stage('Drupal 8 Dynamic') {
                                    when { expression { return isHarnessChange(['drupal8']) } }
                                    steps { sh './test drupal8 dynamic' }
                                }
                                stage('Akeneo 6 Dynamic') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo6 dynamic' }
                                }
                                stage('Akeneo 5 Dynamic') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo5 dynamic' }
                                }
                                stage('Akeneo 4 Dynamic') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo4 dynamic' }
                                }
                                stage('Wordpress Dynamic') {
                                    when { expression { return isHarnessChange(['wordpress']) } }
                                    steps { sh './test wordpress dynamic' }
                                }

                                stage('PHP Mutagen') {
                                    when { expression { return isHarnessChange(['base']) } }
                                    steps { sh './test php dynamic mutagen' }
                                }
                                stage('Drupal 9 Mutagen') {
                                    when { expression { return isHarnessChange(['drupal8']) } }
                                    steps { sh './test drupal9 dynamic mutagen' }
                                }
                                stage('Drupal 8 Mutagen') {
                                    when { expression { return isHarnessChange(['drupal8']) } }
                                    steps { sh './test drupal8 dynamic mutagen' }
                                }
                                stage('Akeneo 6 Mutagen') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo6 dynamic mutagen' }
                                }
                                stage('Akeneo 5 Mutagen') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo5 dynamic mutagen' }
                                }
                                stage('Akeneo 4 Dynamic Mutagen') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo4 dynamic mutagen' }
                                }
                                stage('Wordpress Mutagen') {
                                    when { expression { return isHarnessChange(['wordpress']) } }
                                    steps { sh './test wordpress dynamic mutagen' }
                                }
                            }
                        }
                    }
                    // Need to clean up as it's a different agent
                    post {
                        always {
                            sh './delete_running_containers.sh'
                            cleanWs()
                        }
                    }
                }
                stage('2. Symfony, Magento 2, Magento 1') {
                    // Choose a different agent to our "main" one
                    agent {
                        docker {
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    when {
                        beforeAgent true
                        expression { return isHarnessChange(['symfony', 'magento2', 'magento1']) }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                                sh './build'
                            }
                        }
                        stage('Quality Tests') {
                            environment {
                                TEARDOWN_ENVIRONMENT = "no"
                                TEST_MODE = "quality"
                            }
                            steps {
                                sh './test symfony static'
                                sh './test magento2 static'
                                sh './test magento1 static'

                                sh './test symfony dynamic'
                                sh './test magento2 dynamic'
                                sh './test magento1 dynamic'

                                sh './test symfony dynamic mutagen'
                                sh './test magento2 dynamic mutagen'
                                sh './test magento1 dynamic mutagen'
                            }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('Symfony') {
                                    when { expression { return isHarnessChange(['symfony']) } }
                                    steps { sh './test symfony static' }
                                }
                                stage('Magento 2') {
                                    when { expression { return isHarnessChange(['magento2']) } }
                                    steps { sh './test magento2 static' }
                                }
                                stage('Magento 1') {
                                    when { expression { return isHarnessChange(['magento1']) } }
                                    steps { sh './test magento1 static' }
                                }

                                stage('Symfony Dynamic') {
                                    when { expression { return isHarnessChange(['symfony']) } }
                                    steps { sh './test symfony dynamic' }
                                }
                                stage('Magento 2 Dynamic') {
                                    when { expression { return isHarnessChange(['magento2']) } }
                                    steps { sh './test magento2 dynamic' }
                                }
                                stage('Magento 1 Dynamic') {
                                    when { expression { return isHarnessChange(['magento1']) } }
                                    steps { sh './test magento1 dynamic' }
                                }

                                stage('Symfony Mutagen') {
                                    when { expression { return isHarnessChange(['symfony']) } }
                                    steps { sh './test symfony dynamic mutagen' }
                                }
                                stage('Magento 2 Mutagen') {
                                    when { expression { return isHarnessChange(['magento2']) } }
                                    steps { sh './test magento2 dynamic mutagen' }
                                }
                                stage('Magento 1 Mutagen') {
                                    when { expression { return isHarnessChange(['magento1']) } }
                                    steps { sh './test magento1 dynamic mutagen' }
                                }
                            }
                        }
                    }
                    // Need to clean up as it's a different agent
                    post {
                        always {
                            sh './delete_running_containers.sh'
                            cleanWs()
                        }
                    }
                }
                stage('3. Spryker') {
                    agent {
                        docker {
                            // Reuse the same agent selected at the top of the file
                            reuseNode true
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    when {
                        beforeAgent true
                        expression { return isHarnessChange(['spryker']) }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                            }
                        }
                        stage('Quality Tests') {
                            environment {
                                TEARDOWN_ENVIRONMENT = "no"
                                TEST_MODE = "quality"
                            }
                            steps {
                                sh './test spryker dynamic mutagen'
                                sh './test spryker static'
                                sh './test spryker dynamic'
                            }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('Spryker Mutagen') {
                                    steps { sh './test spryker dynamic mutagen' }
                                }
                                stage('Spryker Static') {
                                    steps { sh './test spryker static' }
                                }
                                stage('Spryker Dynamic') {
                                    steps { sh './test spryker dynamic' }
                                }
                            }
                        }
                    }
                    // No post step, as it will be taken care of in the global cleanup at the bottom
                }
            }
        }
        stage('Success') {
            steps {
                sh 'echo "Success"'
                milestone(100)
            }
        }
    }
    post {
        always {
            sh './delete_running_containers.sh'
            cleanWs()
        }
    }
}
