pipeline {
    agent none
    environment {
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
        parallelsAlwaysFailFast()
    }
    triggers { cron(env.BRANCH_NAME ==~ /^\d+\.\d+\.x$/ ? 'H H(0-6) * * *' : '') }
    stages {
        stage('Build and Test') {
            matrix {
                axes {
                    axis {
                        name 'FRAMEWORKS'
                        values 'php|drupal8|akeneo', 'symfony|magento2|magento1', 'wordpress|spryker'
                    }
                }
                stages {
                    stage('Static Builds') {
                        agent { label "my127ws" }
                        stages {
                            stage('Prepare') {
                                steps { sh './build' }
                            }
                            stage('1 (mode=static)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f1)" static'
                                }
                            }
                            stage('2 (mode=static)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f2)" static'
                                }
                            }
                            stage('3 (mode=static)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f3)" static'
                                }
                            }
                        }
                        post {
                            always {
                                sh '(cd tmp-test && ws destroy) || true'
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Dynamic Builds') {
                        agent { label "my127ws" }
                        stages {
                            stage('Prepare') {
                                steps { sh './build' }
                            }
                            stage('1 (mode=dynamic)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f1)" dynamic'
                                }
                            }
                            stage('2 (mode=dynamic)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f2)" dynamic'
                                }
                            }
                            stage('3 (mode=dynamic)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f3)" dynamic'
                                }
                            }
                        }
                        post {
                            always {
                                sh '(cd tmp-test && ws destroy) || true'
                                sh 'ws destroy || true'
                                cleanWs()
                            }
                        }
                    }
                    stage('Dynamic Builds With Mutagen') {
                        agent { label "my127ws" }
                        stages {
                            stage('Prepare') {
                                steps { sh './build' }
                            }
                            stage('1 (mode=dynamic, sync=mutagen)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f1)" dynamic mutagen'
                                }
                            }
                            stage('2 (mode=dynamic, sync=mutagen)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f2)" dynamic mutagen'
                                }
                            }
                            stage('3 (mode=dynamic, sync=mutagen)') {
                                steps {
                                    sh './test "$(echo "$FRAMEWORKS" | cut -d"|" -f3)" dynamic mutagen'
                                }
                            }
                        }
                        post {
                            always {
                                sh '(cd tmp-test && ws destroy) || true'
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
