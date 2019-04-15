#!/bin/bash

# setup jenkins slave to master
function task_jenkins_setup()
{
    echo -e "Bootstrapping jenkins slave"
    wait_for_jenkins_master

    curl -s "$JENKINS_URL/jnlpJars/jenkins-cli.jar" -o /usr/local/bin/jenkins-cli.jar
    curl -s "$JENKINS_URL/jnlpJars/slave.jar" -o /usr/local/bin/jenkins-slave.jar

    (java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" get-node "$JENKINS_SLAVE_NAME" 2>&1 || true ) > /tmp/jenkins.node

    if grep ERROR: /tmp/jenkins.node >/dev/null; then
        echo -e "Registering jenkins slave $JENKINS_SLAVE_NAME at master"
        # shellcheck disable=SC2154
        cat <<EOF | java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" create-node "$JENKINS_SLAVE_NAME"
            <slave>
              <name>$JENKINS_SLAVE_NAME</name>
              <description></description>
              <remoteFS>/data/shop</remoteFS>
              <numExecutors>1</numExecutors>
              <mode>NORMAL</mode>
              <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
              <launcher class="hudson.slaves.JNLPLauncher"/>
              <label>backend</label>
              <nodeProperties/>
            </slave>
EOF
    else
        echo -e "Already registered as jenkins slave $JENKINS_SLAVE_NAME:"
        cat /tmp/jenkins.node
    fi

    # link php where it is expected by cron.conf
    ln -s /usr/local/bin/php /usr/bin/php
}

function wait_for_jenkins_master() {
    local counter=0
    echo -e "Waiting for jenkins master to be available"

    local counter=0

    while ! curl -s -k "$JENKINS_URL" -o /dev/null -L --fail; do

        if (( counter > 30 )); then
            (>&2 echo "timeout while waiting on $JENKINS_URL to become available")
            exit 1
        fi

        sleep 1
        ((++counter))
    done
}
