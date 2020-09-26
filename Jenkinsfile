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
        stage('Build and Test') {
            parallel {
                stage('1. PHP, Symfony, Wordpress, Akeneo') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test php static'
                        sh './test symfony static'
                        sh './test wordpress static'
                        sh './test php dynamic'
                        sh './test symfony dynamic'
                        sh './test wordpress dynamic'
                        sh './test php dynamic mutagen'
                        sh './test symfony dynamic mutagen'
                        sh './test wordpress dynamic mutagen'
                    }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('2. Drupal 8, Magento 1, Magento 2') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test drupal8 static'
                        sh './test magento1 static'
                        sh './test magento2 static'
                        sh './test drupal8 dynamic'
                        sh './test magento1 dynamic'
                        sh './test magento2 dynamic'
                        sh './test drupal8 dynamic mutagen'
                        sh './test magento1 dynamic mutagen'
                        sh './test magento2 dynamic mutagen'
                    }
                    post {
                        always {
                            sh 'ws destroy || true'
                            cleanWs()
                        }
                    }
                }
                stage('3. Spryker') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test spryker static'
                        sh './test spryker dynamic'
                        sh './test spryker dynamic mutagen'
                    }
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
