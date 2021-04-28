pipeline {
    agent { label 'my127ws' }
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
                stage('1. Static') {
                    // Choose a different agent to our "main" one
                    agent {
                       docker {
                            label 'my127ws'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
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
                                sh './test akeneo static'
                                sh './test drupal8 static'
                                sh './test magento1 static'
                                sh './test magento2 static'
                                sh './test symfony static'
                                sh './test wordpress static'
                                sh './test magento1 dynamic'
                                sh './test magento2 dynamic'
                            }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('PHP') {
                                    steps { sh './test php static' }
                                }
                                stage('Akeneo') {
                                    steps { sh './test akeneo static' }
                                }
                                stage('Drupal 8') {
                                    steps { sh './test drupal8 static' }
                                }
                                stage('Symfony') {
                                    steps { sh './test symfony static' }
                                }
                                stage('Magento 1') {
                                    steps { sh './test magento1 static' }
                                }
                                stage('Magento 2') {
                                    steps { sh './test magento2 static' }
                                }
                                stage('Wordpress') {
                                    steps { sh './test wordpress static' }
                                }
                                stage('Magento 1 Dynamic') {
                                    steps { sh './test magento1 dynamic' }
                                }
                                stage('Magento 2 Dynamic') {
                                    steps { sh './test magento2 dynamic' }
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
                stage('2. Dynamic') {
                    // Choose a different agent to our "main" one
                    agent {
                        docker {
                            label 'my127ws'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
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
                                sh './test php dynamic'
                                sh './test php dynamic mutagen'
                                sh './test akeneo dynamic'
                                sh './test akeneo dynamic mutagen'
                                sh './test drupal8 dynamic'
                                sh './test drupal8 dynamic mutagen'
                                sh './test magento1 dynamic mutagen'
                                sh './test magento2 dynamic mutagen'
                                sh './test symfony dynamic'
                                sh './test symfony dynamic mutagen'
                                sh './test wordpress dynamic'
                                sh './test wordpress dynamic mutagen'
                            }
                        }
                        stage('Install Mutagen') {
                            steps {
                                sh 'apk add grep'
                                sh 'curl --fail --silent --show-error --location --output /tmp/mutagen.tar.gz https://github.com/mutagen-io/mutagen/releases/download/v0.11.8/mutagen_linux_amd64_v0.11.8.tar.gz'
                                sh 'tar -C /usr/local/bin/ -xf /tmp/mutagen.tar.gz'
                                sh 'rm -f /tmp/mutagen.tar.gz'
                            }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('PHP') {
                                    steps { sh './test php dynamic' }
                                }
                                stage('Akeneo') {
                                    steps { sh './test akeneo dynamic' }
                                }
                                stage('Drupal 8') {
                                    steps { sh './test drupal8 dynamic' }
                                }
                                stage('Symfony') {
                                    steps { sh './test symfony dynamic' }
                                }
                                stage('Wordpress') {
                                    steps { sh './test wordpress dynamic' }
                                }
                                stage('PHP Mutagen') {
                                    steps { sh './test php dynamic mutagen' }
                                }
                                stage('Akeneo Mutagen') {
                                    steps { sh './test akeneo dynamic mutagen' }
                                }
                                stage('Drupal 8 Mutagen') {
                                    steps { sh './test drupal8 dynamic mutagen' }
                                }
                                stage('Magento 1 Mutagen') {
                                    steps { sh './test magento1 dynamic mutagen' }
                                }
                                stage('Magento 2 Mutagen') {
                                    steps { sh './test magento2 dynamic mutagen' }
                                }
                                stage('Symfony Mutagen') {
                                    steps { sh './test symfony dynamic mutagen' }
                                }
                                stage('Wordpress Mutagen') {
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
                stage('3. Spryker') {
                    agent {
                        docker {
                            // Reuse the same agent selected at the top of the file
                            reuseNode true
                            label 'my127ws'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
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
                                sh './test spryker static'
                                sh './test spryker dynamic'
                                sh './test spryker dynamic mutagen'
                            }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('Spryker Static') {
                                    steps { sh './test spryker static' }
                                }
                                stage('Spryker Dynamic') {
                                    steps { sh './test spryker dynamic' }
                                }
                                stage('Spryker Dynamic Mutagen') {
                                    steps { sh './test spryker dynamic mutagen' }
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
