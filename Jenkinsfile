pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
    }
    triggers { cron(env.BRANCH_NAME ==~ /^\d+\.\d+\.x$/ ? 'H H(0-6) * * *' : '') }
    stages {
        axes {
            axis {
                name 'FRAMEWORK'
                values 'akeneo', 'drupal8', 'magento1', 'magento2', 'php', 'spryker', 'symfony', 'wordpress'
            }
        }
        stage('Build and Test') {
            parallel {
                stage('1. PHP, Symfony, Wordpress, Akeneo') {
                    stages {
                        stage('PHP Static') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test php static' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                        stage('PHP Dynamic') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test php dynamic' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                        stage('PHP Dynamic Mutagen') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test php dynamic mutagen' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }

                        stage('Symfony Static') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test symfony static' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                        stage('Symfony Dynamic') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test symfony dynamic' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                        stage('Symfony Dynamic Mutagen') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test symfony dynamic mutagen' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }

                        stage('Wordpress Static') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test wordpress static' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                        stage('Wordpress Dynamic') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test wordpress dynamic' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                        stage('Wordpress Dynamic Mutagen') {
                            agent { label "my127ws" }
                            steps { sh './build && ./test wordpress dynamic mutagen' }
                            post {
                                always {
                                    sh 'ws destroy || true'
                                    cleanWs()
                                }
                            }
                        }
                    }
                }
                stage('2. Drupal 8, Magento 1, Magento 2') {
                    stage('Drupal Static') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test drupal8 static' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Drupal Dynamic') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test drupal8 dynamic' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Drupal Dynamic Mutagen') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test drupal8 dynamic mutagen' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }

                    stage('Magento 1 Static') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test magento1 static' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Magento 1 Dynamic') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test magento1 dynamic' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Magento 1 Dynamic Mutagen') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test magento1 dynamic mutagen' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }

                    stage('Magento 2 Static') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test magento2 static' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Magento 2 Dynamic') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test magento2 dynamic' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Magento 2 Dynamic Mutagen') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test magento2 dynamic mutagen' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                }
                stage('3. Spryker Static') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker static' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('4. Spryker Dynamic') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('5. Spryker Dynamic Mutagen') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker dynamic mutagen' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
            }
        }
    }
}
