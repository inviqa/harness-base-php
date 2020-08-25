#!/bin/bash

function task_jenkins_register()
{
    local -r JENKINS_RUNNER_NAME="$(hostname)"

    local -r NODE_OUTPUT="$(java -jar /usr/local/bin/jenkins-cli.jar -s "${JENKINS_URL}" get-node "${JENKINS_RUNNER_NAME}" 2>&1 || true )"

    if ! echo -n "${NODE_OUTPUT}" | grep ERROR: >/dev/null; then
        # In case of runner recreation, jenkins does not allow re-attaching new runner with same node name,
        # may be due to IP change, so here we need to remove it first if already exists, and then re-register
        echo -e "Removing old jenkins runner ${JENKINS_RUNNER_NAME}:"
        java -jar /usr/local/bin/jenkins-cli.jar -s "${JENKINS_URL}" delete-node "${JENKINS_RUNNER_NAME}"
    fi

    echo -e "Registering jenkins runner ${JENKINS_RUNNER_NAME} at master"

    cat <<EOF | java -jar /usr/local/bin/jenkins-cli.jar -s "${JENKINS_URL}" create-node "${JENKINS_RUNNER_NAME}"
        <slave>
            <name>${JENKINS_RUNNER_NAME}</name>
            <description></description>
            <remoteFS>/data/shop</remoteFS>
            <numExecutors>${RUNNER_NUM_EXECUTORS}</numExecutors>
            <mode>NORMAL</mode>
            <retentionStrategy class="hudson.slaves.RetentionStrategy\$Always"/>
            <launcher class="hudson.slaves.JNLPLauncher"/>
            <label>backend</label>
            <nodeProperties/>
        </slave>
EOF
}
