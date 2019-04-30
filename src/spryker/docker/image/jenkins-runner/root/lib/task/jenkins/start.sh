#!/bin/bash

# start jenkins runner
function task_jenkins_start()
{
    java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" offline-node ""
    java -jar /usr/local/bin/jenkins-slave.jar -jnlpUrl "$JENKINS_URL/computer/$JENKINS_RUNNER_NAME/slave-agent.jnlp" &
}