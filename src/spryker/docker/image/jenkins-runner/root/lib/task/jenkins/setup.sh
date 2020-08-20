#!/bin/bash

function task_jenkins_setup()
{
    echo -e "Bootstrapping jenkins runner"
    task http:wait "$JENKINS_URL"

    curl -s "$JENKINS_URL/jnlpJars/jenkins-cli.jar" -o /usr/local/bin/jenkins-cli.jar
    curl -s "$JENKINS_URL/jnlpJars/slave.jar" -o /usr/local/bin/jenkins-slave.jar

    # link php where it is expected by cron.conf
    ln -s /usr/local/bin/php /usr/bin/php
}
