# start jenkins runner

function _trap_jenkins_exit()
{
    echo 'Terminating jenkins agent' >&2
    kill -TERM $(jobs -p)
    wait
    app jenkins unregister
}

function task_jenkins_start()
{
    JENKINS_RUNNER_NAME=$(hostname)

    trap _trap_jenkins_exit EXIT

    app jenkins:register

    java -jar /usr/local/bin/jenkins-cli.jar -s "$JENKINS_URL" offline-node ""
    java -jar /usr/local/bin/jenkins-slave.jar -jnlpUrl "$JENKINS_URL/computer/$JENKINS_RUNNER_NAME/slave-agent.jnlp" &

    wait
}
