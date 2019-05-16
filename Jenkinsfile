pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key')
    }
    stages {
        stage('Mode - Dynamic') {
            parallel {
                stage('drupal8') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test drupal8 dynamic'
                    }
                }
                stage('magento1') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento1 dynamic'
                    }
                }
                stage('magento2') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento2 dynamic'
                    }
                }
                stage('spryker') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test spryker dynamic'
                    }
                }
                stage('wordpress') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test wordpress dynamic'
                    }
                }
            }
        }
        stage('Mode - Static') {
            parallel {
                stage('drupal8') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test drupal8 static'
                    }
                }
                stage('magento1') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento1 static'
                    }
                }
                stage('magento2') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test magento2 static'
                    }
                }
                stage('spryker') {
                    agent { label "my127ws" }
                    steps {
                        sh './build'
                        sh './test spryker static'
                    }
                }
                stage('wordpress') {
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
