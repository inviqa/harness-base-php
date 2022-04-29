#!/bin/bash

function task_jenkins_setup()
{
    echo -e "Bootstrapping jenkins runner"
    task http:wait "$JENKINS_URL"

    curl --fail --silent --show-error --location --output /usr/local/bin/jenkins-cli.jar "$JENKINS_URL/jnlpJars/jenkins-cli.jar"
    curl --fail --silent --show-error --location --output /usr/local/bin/jenkins-slave.jar "$JENKINS_URL/jnlpJars/slave.jar"
}
