pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key')
    }
    stages {
        stage('Environment') {
            parallel {
                stage('drupal8-dynamic') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test drupal8 dynamic'
                    }
                }
                stage('drupal8-static') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test drupal8 static'
                    }
                }
                stage('magento1-dynamic') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento1 dynamic'
                    }
                }
                stage('magento1-static') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento1 static'
                    }
                }
                stage('magento2-dynamic') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento2 dynamic'
                    }
                }
                stage('magento2-static') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento2 static'
                    }
                }
                stage('spryker-dynamic') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test spryker dynamic'
                    }
                }
                stage('spryker-static') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test spryker static'
                    }
                }
                stage('wordpress-dynamic') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test wordpress dynamic'
                    }
                }
                stage('wordpress-static') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test wordpress static'
                    }
                }
            }
        }
    }
}
