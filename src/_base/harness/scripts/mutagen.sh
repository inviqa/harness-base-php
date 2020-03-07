#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "This script supports only one parameter"
    exit 1
fi

COMMAND="$1"
PATH="$PATH:./.my127ws/utilities/mutagen/"

install_mutagen()
{
    if ! command -v mutagen > /dev/null 2>&1; then
        if command -v sw_vers > /dev/null 2>&1 && sw_vers | grep -q Mac; then
            passthru brew install mutagen-io/mutagen/mutagen
        else
            mkdir -p .my127ws/utilities/mutagen/
            run curl -L -q -sS -f https://github.com/mutagen-io/mutagen/releases/download/v0.11.2/mutagen_linux_amd64_v0.11.2.tar.gz -o .my127ws/utilities/mutagen/mutagen.tar.gz
            run "cd .my127ws/utilities/mutagen/ && tar -xf mutagen.tar.gz"
        fi
    fi
}

setup_sync_container()
{
    if [[ "$(docker ps -a -f "name=${NAMESPACE}-sync" --format '{{.Names}}')" == "${NAMESPACE}-sync" ]]; then
      passthru docker rm -f "${NAMESPACE}-sync"
    fi
    passthru docker run -d --name "${NAMESPACE}-sync" -v "${NAMESPACE}-sync":/app alpine:latest tail -f /dev/null
}

start_mutagen_daemon()
{
    passthru mutagen daemon start
}

start()
{
    install_mutagen
    setup_sync_container
    start_mutagen_daemon

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

case "$COMMAND" in
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
