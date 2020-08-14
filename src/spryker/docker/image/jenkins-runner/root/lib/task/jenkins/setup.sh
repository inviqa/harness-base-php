#!/bin/bash

# setup jenkins runner to master
function task_jenkins_setup()
{
    echo -e "Bootstrapping jenkins runner"
    task http:wait "$JENKINS_URL"

    curl -s "$JENKINS_URL/jnlpJars/jenkins-cli.jar" -o /usr/local/bin/jenkins-cli.jar
    curl -s "$JENKINS_URL/jnlpJars/slave.jar" -o /usr/local/bin/jenkins-slave.jar

    (java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" get-node "$JENKINS_RUNNER_NAME" 2>&1 || true ) > /tmp/jenkins.node

    if ! grep ERROR: /tmp/jenkins.node >/dev/null; then
        # In case of runner recreation, jenkins does not allow re-attaching new runner with same node name,
        # may be due to IP change, so here we need to remove it first if already exists, and then re-register
        echo -e "Removing old jenkins runner $JENKINS_RUNNER_NAME:"
        java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" delete-node "$JENKINS_RUNNER_NAME"
    fi

    echo -e "Registering jenkins runner $JENKINS_RUNNER_NAME at master"
        # shellcheck disable=SC2154
        cat <<EOF | java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" create-node "$JENKINS_RUNNER_NAME"
            <slave>
              <name>$JENKINS_RUNNER_NAME</name>
              <description></description>
              <remoteFS>/data/shop</remoteFS>
              <numExecutors>3</numExecutors>
              <mode>NORMAL</mode>
              <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
              <launcher class="hudson.slaves.JNLPLauncher"/>
              <label>backend</label>
              <nodeProperties/>
            </slave>
EOF

    # link php where it is expected by cron.conf
    ln -s /usr/local/bin/php /usr/bin/php
}
