pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
        parallelsAlwaysFailFast()
    }
    triggers { cron(env.BRANCH_NAME ==~ /^\d+\.\d+\.x$/ ? 'H H(2-6) * * 1' : '') }
    stages {
        stage('Build and Test') {
            parallel {
                stage('1. PHP, Symfony, Akeneo') {
                    agent {
                        docker {
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                                sh './build'
                            }
                        }
                        stage('Akeneo Static') {
                            steps { sh './test akeneo static' }
                        }
                        stage('Symfony Static') {
                            steps { sh './test symfony static' }
                        }
                        stage('Akeneo Dynamic') {
                            steps { sh './test akeneo dynamic' }
                        }
                        stage('Symfony Dynamic') {
                            steps { sh './test symfony dynamic' }
                        }
                        stage('Akeneo Dynamic Mutagen') {
                            steps { sh './test akeneo dynamic mutagen' }
                        }
                        stage('Symfony Dynamic Mutagen') {
                            steps { sh './test symfony dynamic mutagen' }
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
