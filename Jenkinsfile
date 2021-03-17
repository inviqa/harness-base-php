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
        stage('Quality Checks') {
            agent {
               docker {
                    label 'my127ws'
                    alwaysPull true
                    image 'quay.io/inviqa_images/workspace:latest'
                    args '--entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                }
            }
            steps {
                sh './build'
                sh './quality'
            }
            post {
                always {
                    cleanWs()
                }
            }
        }
        stage('Build and Test') {
            parallel {
                stage('1. PHP, Drupal 8, Akeneo') {
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
                        stage('PHP Static') {
                            steps { sh './test php static' }
                        }
                        stage('Drupal 8 Static') {
                            steps { sh './test drupal8 static' }
                        }
                        stage('Akeneo Static') {
                            steps { sh './test akeneo static' }
                        }
                        stage('PHP Dynamic') {
                            steps { sh './test php dynamic' }
                        }
                        stage('Drupal 8 Dynamic') {
                            steps { sh './test drupal8 dynamic' }
                        }
                        stage('Akeneo Dynamic') {
                            steps { sh './test akeneo dynamic' }
                        }
                        stage('PHP Dynamic Mutagen') {
                            steps { sh './test php dynamic mutagen' }
                        }
                        stage('Drupal 8 Dynamic Mutagen') {
                            steps { sh './test drupal8 dynamic mutagen' }
                        }
                        stage('Akeneo Dynamic Mutagen') {
                            steps { sh './test akeneo dynamic mutagen' }
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
                stage('2. Symfony, Magento 2, Magento 1') {
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
                        stage('Symfony Static') {
                            steps { sh './test symfony static' }
                        }
                        stage('Magento 2 Static') {
                            steps { sh './test magento2 static' }
                        }
                        stage('Magento 1 Static') {
                            steps { sh './test magento1 static' }
                        }
                        stage('Symfony Dynamic') {
                            steps { sh './test symfony dynamic' }
                        }
                        stage('Magento 2 Dynamic') {
                            steps { sh './test magento2 dynamic' }
                        }
                        stage('Magento 1 Dynamic') {
                            steps { sh './test magento1 dynamic' }
                        }
                        stage('Symfony Dynamic Mutagen') {
                            steps { sh './test symfony dynamic mutagen' }
                        }
                        stage('Magento 2 Dynamic Mutagen') {
                            steps { sh './test magento2 dynamic mutagen' }
                        }
                        stage('Magento 1 Dynamic Mutagen') {
                            steps { sh './test magento1 dynamic mutagen' }
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
                stage('3. Wordpress, Spryker') {
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
                        stage('Wordpress Static') {
                            steps { sh './test wordpress static' }
                        }
                        stage('Spryker Static') {
                            steps { sh './test spryker static' }
                        }
                        stage('Wordpress Dynamic') {
                            steps { sh './test wordpress dynamic' }
                        }
                        stage('Spryker Dynamic') {
                            steps { sh './test spryker dynamic' }
                        }
                        stage('Wordpress Dynamic Mutagen') {
                            steps { sh './test wordpress dynamic mutagen' }
                        }
                        stage('Spryker Dynamic Mutagen') {
                            steps { sh './test spryker dynamic mutagen' }
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
