#!/usr/bin/env bash

if [ $# -ne 1 ]; then
	echo "This script supports only one parameter"
	exit 1
fi

COMMAND=$1

install_mutagen()
{
    if ! command -v mutagen > /dev/null 2>&1; then
      passthru brew install mutagen-io/mutagen/mutagen
    fi
}

setup_sync_container()
{
    if [[ $(docker ps -a -f "name=${NAMESPACE}-sync" --format '{{.Names}}') == "${NAMESPACE}-sync" ]]; then
      passthru docker rm -f "${NAMESPACE}-sync"
    fi
    passthru docker run -d --name "${NAMESPACE}-sync" -v "${NAMESPACE}-sync":/app alpine:latest tail -f /dev/null
}

start()
{
    install_mutagen
    setup_sync_container

    mutagen project list > /dev/null 2>&1 && passthru mutagen project terminate
    passthru mutagen project start
    passthru mutagen project flush
}

stop()
{
    passthru mutagen project terminate
    passthru docker rm -f "${NAMESPACE}-sync"
}

pause()
{
    passthru mutagen project pause
    passthru docker stop "${NAMESPACE}-sync"
}

resume()
{
    passthru docker start "${NAMESPACE}-sync"
    passthru mutagen project resume
}

case $COMMAND in
    start)
        start
        ;;
    stop)
        stop
        ;;
    pause)
        pause
        ;;
    resume)
        resume
        ;;
    *)
        echo "Command not supported"
        exit 1
        ;;
esac
