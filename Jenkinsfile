pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    triggers { cron(env.BRANCH_NAME == '0.3.x' ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Test Matrix') {
            parallel {

                // Drupal 8

                stage('drupal8 (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test drupal8 dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('drupal8 (mode=static)')  {
                    agent { label "my127ws" }
                    steps { sh './build && ./test drupal8 static' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }

                // Magento 1

                stage('magento1 (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento1 dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('magento1 (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento1 static' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }

                // Magento 2

                stage('magento2 (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento2 dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('magento2 (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento2 static' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }

                // PHP

                stage('php (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test php dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('php (mode=static)')  {
                    agent { label "my127ws" }
                    steps { sh './build && ./test php static' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }

                // Spryker

                stage('spryker (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('spryker (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker static' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }

                // Wordpress

                stage('wordpress (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test wordpress dynamic' }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('wordpress (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test wordpress static' }
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
