pipeline {
    agent none
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
        stage('Build and Test') {
            parallel {
                stage('1. Drupal 8, Magento 2') {
                    agent { label "my127ws" }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                                sh './build'
                            }
                        }
                        stage('Drupal 8 Static') {
                            steps { sh './test drupal8 static' }
                        }
                        stage('Magento 2 Static') {
                            steps { sh './test magento2 static' }
                        }
                        stage('Drupal 8 Dynamic') {
                            steps { sh './test drupal8 dynamic' }
                        }
                        stage('Magento 2 Dynamic') {
                            steps { sh './test magento2 dynamic' }
                        }
                        stage('Drupal 8 Dynamic Mutagen') {
                            steps { sh './test drupal8 dynamic mutagen' }
                        }
                        stage('Magento 2 Dynamic Mutagen') {
                            steps { sh './test magento2 dynamic mutagen' }
                        }
                    }
                    post {
                        always {
                            sh '(cd tmp-test && ws destroy) || true'
                            sh 'ws destroy || true'
                            sh './delete_running_containers.sh'
                            cleanWs()
                        }
                    }
                }
            }
        }
    }
}
