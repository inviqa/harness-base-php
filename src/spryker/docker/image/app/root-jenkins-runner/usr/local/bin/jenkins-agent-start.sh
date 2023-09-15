#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

function _trap_jenkins_exit()
{
    echo 'Terminating jenkins agent' >&2
    local CHILD_PIDS
    mapfile -t CHILD_PIDS < <(jobs -p)
    kill -TERM "${CHILD_PIDS[@]}"
    wait
    app jenkins unregister
}

function start()
{
    local -r JENKINS_RUNNER_NAME=$(hostname)

    trap _trap_jenkins_exit EXIT

    app jenkins:register

    java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" offline-node ""
    java -jar /usr/local/bin/jenkins-slave.jar -jnlpUrl "$JENKINS_URL/computer/$JENKINS_RUNNER_NAME/slave-agent.jnlp" &

    wait
}

start
