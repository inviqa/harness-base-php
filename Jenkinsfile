def isHarnessChange(harnesses) {
    def harnessLabels = harnesses.collect { "harness-${it}".toString() } << 'harness-all'
    return !env.CHANGE_ID || pullRequest.labels.size() == 0 || harnessLabels.any { pullRequest.labels.contains(it) }
}
def failureMessages = []

pipeline {
    agent { label 'linux-amd64' }
    environment {
        COMPOSE_DOCKER_CLI_BUILD = 1
        DOCKER_BUILDKIT = 1
        MY127WS_KEY = credentials('base-my127ws-key-20190523')
        SLACK_NOTIFICATION_CHANNEL = credentials('slack-notification-channel')
        SLACK_TOKEN_CREDENTIAL_ID = credentials('slack-token-credential-id')
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '30'))
        parallelsAlwaysFailFast()
    }
    triggers { cron(env.BRANCH_NAME ==~ /^\d+\.\d+\.x$/ ? 'H H(2-6) * * 1' : '') }
    stages {
        stage('Quality Checks') {
            steps {
                sh './build'
                sh './quality'
                milestone(10)
            }
            post { failure { script { failureMessages << 'Global quality checks' } } }
        }
        stage('Build and Test') {
            parallel {
                stage('1. PHP, Drupal, Wordpress') {
                    // Choose a different agent to our "main" one
                    agent {
                       docker {
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    when {
                        beforeAgent true
                        expression { return isHarnessChange(['php', 'drupal', 'wordpress']) }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                                sh './build'
                            }
                            post { failure { script { failureMessages << 'PHP, Drupal, Wordpress prepare' } } }
                        }
                        stage('Quality Tests') {
                            environment {
                                TEARDOWN_ENVIRONMENT = "no"
                                TEST_MODE = "quality"
                            }
                            steps {
                                sh './test php static'
                                sh './test drupal10 static'
                                sh './test drupal9 static'
                                sh './test drupal8 static'
                                sh './test wordpress static'
                                sh './test php dynamic'
                                sh './test drupal10 dynamic'
                                sh './test drupal9 dynamic'
                                sh './test drupal8 dynamic'
                                sh './test wordpress dynamic'
                                sh './test php dynamic mutagen'
                                sh './test drupal10 dynamic mutagen'
                                sh './test drupal9 dynamic mutagen'
                                sh './test drupal8 dynamic mutagen'
                                sh './test wordpress dynamic mutagen'
                            }
                            post { failure { script { failureMessages << 'PHP, Drupal, Wordpress quality checks' } } }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('PHP') {
                                    when { expression { return isHarnessChange(['php']) } }
                                    steps { sh './test php static' }
                                    post { failure { script { failureMessages << 'PHP static acceptance' } } }
                                }
                                stage('Drupal 10') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal10 static' }
                                    post { failure { script { failureMessages << 'Drupal 10 static acceptance' } } }
                                }
                                stage('Drupal 9') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal9 static' }
                                    post { failure { script { failureMessages << 'Drupal 9 static acceptance' } } }
                                }
                                stage('Drupal 8') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal8 static' }
                                    post { failure { script { failureMessages << 'Drupal 8 static acceptance' } } }
                                }
                                stage('Wordpress') {
                                    when { expression { return isHarnessChange(['wordpress']) } }
                                    steps { sh './test wordpress static' }
                                    post { failure { script { failureMessages << 'Wordpress static acceptance' } } }
                                }

                                stage('PHP Dynamic') {
                                    when { expression { return isHarnessChange(['php']) } }
                                    steps { sh './test php dynamic' }
                                    post { failure { script { failureMessages << 'PHP dynamic acceptance' } } }
                                }
                                stage('Drupal 10 Dynamic') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal10 dynamic' }
                                    post { failure { script { failureMessages << 'Drupal 10 dynamic acceptance' } } }
                                }
                                stage('Drupal 9 Dynamic') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal9 dynamic' }
                                    post { failure { script { failureMessages << 'Drupal 9 dynamic acceptance' } } }
                                }
                                stage('Drupal 8 Dynamic') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal8 dynamic' }
                                    post { failure { script { failureMessages << 'Drupal 8 dynamic acceptance' } } }
                                }
                                stage('Wordpress Dynamic') {
                                    when { expression { return isHarnessChange(['wordpress']) } }
                                    steps { sh './test wordpress dynamic' }
                                    post { failure { script { failureMessages << 'Wordpress dynamic acceptance' } } }
                                }

                                stage('PHP Mutagen') {
                                    when { expression { return isHarnessChange(['php']) } }
                                    steps { sh './test php dynamic mutagen' }
                                    post { failure { script { failureMessages << 'PHP mutagen acceptance' } } }
                                }
                                stage('Drupal 10 Mutagen') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal10 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Drupal 10 mutagen acceptance' } } }
                                }
                                stage('Drupal 9 Mutagen') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal9 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Drupal 9 mutagen acceptance' } } }
                                }
                                stage('Drupal 8 Mutagen') {
                                    when { expression { return isHarnessChange(['drupal']) } }
                                    steps { sh './test drupal8 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Drupal 8 mutagen acceptance' } } }
                                }
                                stage('Wordpress Mutagen') {
                                    when { expression { return isHarnessChange(['wordpress']) } }
                                    steps { sh './test wordpress dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Wordpress mutagen acceptance' } } }
                                }
                            }
                        }
                    }
                    // Need to clean up as it's a different agent
                    post {
                        always {
                            sh './delete_running_containers.sh'
                            cleanWs()
                        }
                    }
                }
                stage('2. Symfony, Magento 2, Magento 1') {
                    // Choose a different agent to our "main" one
                    agent {
                        docker {
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    when {
                        beforeAgent true
                        expression { return isHarnessChange(['symfony', 'magento2', 'magento1']) }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                                sh './build'
                            }
                            post { failure { script { failureMessages << 'Symfony, Magento 2, Magento 1 prepare' } } }
                        }
                        stage('Quality Tests') {
                            environment {
                                TEARDOWN_ENVIRONMENT = "no"
                                TEST_MODE = "quality"
                            }
                            steps {
                                sh './test symfony static'
                                sh './test magento2 static'
                                sh './test magento1 static'

                                sh './test symfony dynamic'
                                sh './test magento2 dynamic'
                                sh './test magento1 dynamic'

                                sh './test symfony dynamic mutagen'
                                sh './test magento2 dynamic mutagen'
                                sh './test magento1 dynamic mutagen'
                            }
                            post { failure { script { failureMessages << 'Symfony, Magento 2, Magento 1 quality checks' } } }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('Symfony') {
                                    when { expression { return isHarnessChange(['symfony']) } }
                                    steps { sh './test symfony static' }
                                    post { failure { script { failureMessages << 'Symfony static acceptance' } } }
                                }
                                stage('Magento 2') {
                                    when { expression { return isHarnessChange(['magento2']) } }
                                    steps { sh './test magento2 static' }
                                    post { failure { script { failureMessages << 'Magento 2 static acceptance' } } }
                                }
                                stage('Magento 1') {
                                    when { expression { return isHarnessChange(['magento1']) } }
                                    steps { sh './test magento1 static' }
                                    post { failure { script { failureMessages << 'Magento 1 static acceptance' } } }
                                }

                                stage('Symfony Dynamic') {
                                    when { expression { return isHarnessChange(['symfony']) } }
                                    steps { sh './test symfony dynamic' }
                                    post { failure { script { failureMessages << 'Symfony dynamic acceptance' } } }
                                }
                                stage('Magento 2 Dynamic') {
                                    when { expression { return isHarnessChange(['magento2']) } }
                                    steps { sh './test magento2 dynamic' }
                                    post { failure { script { failureMessages << 'Magento 2 dynamic acceptance' } } }
                                }
                                stage('Magento 1 Dynamic') {
                                    when { expression { return isHarnessChange(['magento1']) } }
                                    steps { sh './test magento1 dynamic' }
                                    post { failure { script { failureMessages << 'Magento 1 dynamic acceptance' } } }
                                }

                                stage('Symfony Mutagen') {
                                    when { expression { return isHarnessChange(['symfony']) } }
                                    steps { sh './test symfony dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Symfony mutagen acceptance' } } }
                                }
                                stage('Magento 2 Mutagen') {
                                    when { expression { return isHarnessChange(['magento2']) } }
                                    steps { sh './test magento2 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Magento 2 mutagen acceptance' } } }
                                }
                                stage('Magento 1 Mutagen') {
                                    when { expression { return isHarnessChange(['magento1']) } }
                                    steps { sh './test magento1 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Magento 1 mutagen acceptance' } } }
                                }
                            }
                        }
                    }
                    // Need to clean up as it's a different agent
                    post {
                        always {
                            sh './delete_running_containers.sh'
                            cleanWs()
                        }
                    }
                }
                stage('3. Akeneo, Spryker') {
                    agent {
                        docker {
                            // Reuse the same agent selected at the top of the file
                            reuseNode true
                            label 'linux-amd64'
                            alwaysPull true
                            image 'quay.io/inviqa_images/workspace:latest'
                            args '--group-add docker --entrypoint "" --volume /var/run/docker.sock:/var/run/docker.sock --volume "$HOME/.my127:/root/.my127"'
                        }
                    }
                    when {
                        beforeAgent true
                        expression { return isHarnessChange(['akeneo', 'spryker']) }
                    }
                    stages {
                        stage('Prepare') {
                            steps {
                                sh './delete_running_containers.sh'
                            }
                            post { failure { script { failureMessages << 'Akeneo, Spryker prepare' } } }
                        }
                        stage('Quality Tests') {
                            environment {
                                TEARDOWN_ENVIRONMENT = "no"
                                TEST_MODE = "quality"
                            }
                            steps {
                                sh './test akeneo6 dynamic mutagen'
                                sh './test akeneo5 dynamic mutagen'
                                sh './test akeneo4 dynamic mutagen'
                                sh './test spryker dynamic mutagen'

                                sh './test akeneo6 static'
                                sh './test akeneo5 static'
                                sh './test akeneo4 static'
                                sh './test spryker static'

                                sh './test akeneo6 dynamic'
                                sh './test akeneo5 dynamic'
                                sh './test akeneo4 dynamic'
                                sh './test spryker dynamic'
                            }
                            post { failure { script { failureMessages << 'Akeneo, Spryker quality checks' } } }
                        }
                        stage('Acceptance Tests') {
                            environment {
                                REUSE_EXISTING_WORKSPACE = "yes"
                                TEST_MODE = "acceptance"
                            }
                            stages {
                                stage('Akeneo 6 Mutagen') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo6 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Akeneo 6 mutagen acceptance' } } }
                                }
                                stage('Akeneo 5 Mutagen') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo5 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Akeneo 5 mutagen acceptance' } } }
                                }
                                stage('Akeneo 4 Dynamic Mutagen') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo4 dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Akeneo 4 mutagen acceptance' } } }
                                }
                                stage('Spryker Mutagen') {
                                    when { expression { return isHarnessChange(['spryker']) } }
                                    steps { sh './test spryker dynamic mutagen' }
                                    post { failure { script { failureMessages << 'Spryker mutagen acceptance' } } }
                                }

                                stage('Akeneo 6 Static') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo6 static' }
                                    post { failure { script { failureMessages << 'Akeneo 6 static acceptance' } } }
                                }
                                stage('Akeneo 5Static') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo5 static' }
                                    post { failure { script { failureMessages << 'Akeneo 5 static acceptance' } } }
                                }
                                stage('Akeneo 4 Static') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo4 static' }
                                    post { failure { script { failureMessages << 'Akeneo 4 static acceptance' } } }
                                }

                                stage('Spryker Static') {
                                    when { expression { return isHarnessChange(['spryker']) } }
                                    steps { sh './test spryker static' }
                                    post { failure { script { failureMessages << 'Spryker static acceptance' } } }
                                }

                                stage('Akeneo 6 Dynamic') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo6 dynamic' }
                                    post { failure { script { failureMessages << 'Akeneo 6 dynamic acceptance' } } }
                                }
                                stage('Akeneo 5 Dynamic') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo5 dynamic' }
                                    post { failure { script { failureMessages << 'Akeneo 5 dynamic acceptance' } } }
                                }
                                stage('Akeneo 4 Dynamic') {
                                    when { expression { return isHarnessChange(['akeneo']) } }
                                    steps { sh './test akeneo4 dynamic' }
                                    post { failure { script { failureMessages << 'Akeneo 4 dynamic acceptance' } } }
                                }
                                stage('Spryker Dynamic') {
                                    when { expression { return isHarnessChange(['spryker']) } }
                                    steps { sh './test spryker dynamic' }
                                    post { failure { script { failureMessages << 'Spryker dynamic acceptance' } } }
                                }
                            }
                        }
                    }
                    // No post step, as it will be taken care of in the global cleanup at the bottom
                }
            }
        }
        stage('Success') {
            steps {
                sh 'echo "Success"'
                milestone(100)
            }
        }
    }
    post {
        failure {
            script {
                def message = "${env.JOB_NAME} #${env.BUILD_NUMBER} - Failure after ${currentBuild.durationString.minus(' and counting')} (<${env.RUN_DISPLAY_URL}|View Build>)"
                def fallbackMessages = [ message ]
                def fields = []

                def shortCommitHash = "${GIT_COMMIT}".substring(0, 7)
                def commitLink = "<https://github.com/inviqa/harness-base-php/commit/${GIT_COMMIT}|${shortCommitHash}>"
                def gitMessage = "Branch <https://github.com/inviqa/harness-base-php/tree/${GIT_BRANCH}|${GIT_BRANCH}> @ ${commitLink}"

                if (env.CHANGE_URL) {
                    // Jenkins builds pull requests by merging the pull request branch into the pull request's target branch,
                    // so we build on commits that do not technically exist and can't link to them.
                    gitMessage = "<${env.CHANGE_URL}|Pull Request #${env.CHANGE_ID}> ${env.CHANGE_TITLE} - merged into target branch <https://github.com/inviqa/harness-base-php/tree/${CHANGE_TARGET}|${CHANGE_TARGET}>"
                }
                fields << [
                    title: 'Source',
                    value: gitMessage,
                    short: false
                ]
                fallbackMessages << gitMessage

                def failureMessage = failureMessages.join("\n")
                if (failureMessage) {
                    fields << [
                        title: 'Reason(s)',
                        value: failureMessage,
                        short: false
                    ]
                    fallbackMessages << failureMessage
                }
                def attachments = [
                    [
                        text: message,
                        fallback: fallbackMessages.join("\n"),
                        color: 'danger',
                        fields: fields
                    ]
                ]

                slackSend (channel: env.SLACK_NOTIFICATION_CHANNEL, color: 'danger', attachments: attachments, tokenCredentialId: env.SLACK_TOKEN_CREDENTIAL_ID)
            }
        }
        always {
            sh './delete_running_containers.sh'
            cleanWs()
        }
    }
}
