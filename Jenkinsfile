pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key')
    }
    stages {
        stage('Test Matrix') {
            parallel {

                // Drupal 8

                stage('drupal8 (mode=dynamic)') {
                    agent { label "my127ws" } 
                    steps { sh './build && ./test drupal8 dynamic' }
                }
                stage('drupal8 (mode=static)')  {
                    agent { label "my127ws" }
                    steps { sh './build && ./test drupal8 static' }
                }

                // Magento 1

                stage('magento1 (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento1 dynamic' }
                }
                stage('magento1 (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento1 static' }
                }

                // Magento 2

                stage('magento2 (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento2 dynamic' }
                }
                stage('magento2 (mode=static)') { 
                    agent { label "my127ws" }
                    steps { sh './build && ./test magento2 static' }
                }

                // Spryker

                stage('spryker (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker dynamic' }
                }
                stage('spryker (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test spryker static' }
                }

                // Wordpress

                stage('wordpress (mode=dynamic)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test wordpress dynamic' }
                }
                stage('wordpress (mode=static)') {
                    agent { label "my127ws" }
                    steps { sh './build && ./test wordpress static' }
                }
            }
        }
    }
}
