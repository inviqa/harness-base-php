#!/bin/bash

wait_for_http_service() {
    local counter=0

    url=$1; shift

    echo "Waiting for $url to come up ..."

    until curl -s -k  $url -o /dev/null -L --fail; do

        if (( counter > 30 )); then
            (>&2 echo "timeout while waiting on $url to become available")
            exit 1
        fi

        sleep 1
        ((counter++))
    done
}

setup_jenkins_slave()
{
    echo -e "Bootstrapping jenkins slave ..."
    # install java runtime
    # todo: move to a separate image
    apt-get update -qq
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install openjdk-8-jre
    apt-get auto-remove -qq -y
    apt-get clean
    rm -rf /var/lib/apt/lists/*

    echo -e "Waiting for jenkins master to be available ..."
    wait_for_http_service $JENKINS_URL

    curl -s $JENKINS_URL/jnlpJars/jenkins-cli.jar -o /usr/local/bin/jenkins-cli.jar
    curl -s $JENKINS_URL/jnlpJars/slave.jar -o /usr/local/bin/jenkins-slave.jar

    (java -jar /usr/local/bin/jenkins-cli.jar -s $JENKINS_URL get-node $JENKINS_SLAVE_NAME 2>&1 || true ) > /tmp/jenkins.node

    if grep ERROR: /tmp/jenkins.node >/dev/null; then
        echo -e "Registering jenkins slave $JENKINS_SLAVE_NAME at master ... "
        cat <<EOF | java -jar /usr/local/bin/jenkins-cli.jar -s $JENKINS_URL create-node $JENKINS_SLAVE_NAME
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

start_jenkins_slave()
{
    java -jar /usr/local/bin/jenkins-cli.jar -s $JENKINS_URL offline-node ""
    java -jar /usr/local/bin/jenkins-slave.jar -jnlpUrl $JENKINS_URL/computer/$JENKINS_SLAVE_NAME/slave-agent.jnlp &
}

bootstrap()
{
    setup_jenkins_slave
    start_jenkins_slave
}
