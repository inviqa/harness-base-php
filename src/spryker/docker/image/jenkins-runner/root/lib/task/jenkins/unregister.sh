#!/bin/bash

function task_jenkins_unregister()
{
    JENKINS_RUNNER_NAME="$(hostname)"

    NODE_OUTPUT="$(java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" get-node "$JENKINS_RUNNER_NAME" 2>&1 || true )"

    if ! echo -n "$NODE_OUTPUT" | grep ERROR: >/dev/null; then
        echo -e "Unregistering jenkins runner $JENKINS_RUNNER_NAME:"
        java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" delete-node "$JENKINS_RUNNER_NAME"
    fi
}
