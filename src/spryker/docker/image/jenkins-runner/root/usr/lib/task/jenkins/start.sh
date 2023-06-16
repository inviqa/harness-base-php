#!/bin/bash

function task_jenkins_start()
{
    exec su -s /usr/local/bin/jenkins-agent-start.sh www-data
}
