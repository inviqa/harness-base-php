pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
    }
    stages {
        stage('BuildAndTest') {
            matrix {
                axes {
                    axis {
                        name 'FRAMEWORK'
                        values 'drupal8', 'magento1', 'magento2', 'spryker', 'wordpress'
                    }
                }
                stages {
                    stage('Test (mode=static)') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test $FRAMEWORK static' }
                        post {
                            always {
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Test (mode=dynamic)') {
                        agent { label "my127ws" }
                        steps { sh './build && ./test $FRAMEWORK dynamic' }
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
}
