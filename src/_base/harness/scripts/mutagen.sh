#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if [ "$#" -ne 1 ]; then
    echo "This script supports only one parameter"
    exit 1
fi

COMMAND="$1"
PATH="$PATH:./.my127ws/utilities/mutagen/"

# shellcheck disable=SC2206
CONTAINER_NAMES=($CONTAINER_NAMES)

install_mutagen()
{
    if command -v mutagen > /dev/null 2>&1; then
        return 0
    fi

    if command -v sw_vers > /dev/null 2>&1 && sw_vers | grep -q Mac && command -v brew > /dev/null 2>&1; then
        passthru brew install mutagen-io/mutagen/mutagen
        return "$?"
    fi
    mkdir -p .my127ws/utilities/mutagen/
    local download_url=""
    download_url="$(php .my127ws/harness/scripts/latest-mutagen-release.php)"
    if [ -z "$download_url" ]; then
        echo "Failed to get mutagen download link. Please install mutagen globally."
        return 1
    fi

    run curl -L -q -sS -f "$download_url" -o .my127ws/utilities/mutagen/mutagen.tar.gz
    run "cd .my127ws/utilities/mutagen/ && tar -xf mutagen.tar.gz"
}

setup_sync_container()
{
    local CONTAINER_NAME
    local CONTAINER_VOLUME_MAPPINGS
    local line
    for CONTAINER_NAME in "${CONTAINER_NAMES[@]}"; do
        if [[ "$(docker ps -a -f "name=${CONTAINER_NAME}" --format '{{.Names}}')" == "${CONTAINER_NAME}" ]]; then
            passthru docker rm -f "${CONTAINER_NAME}"
        fi

        CONTAINER_VOLUME_MAPPINGS=()
        while IFS= read -r line; do
            CONTAINER_VOLUME_MAPPINGS+=("$line")
        done < <(echo "${VOLUME_MAPPINGS}" | grep "^${CONTAINER_NAME}" | cut -d ':' -f2- )

        # shellcheck disable=SC2046
        passthru docker run -d --name "${CONTAINER_NAME}" $(printf -- '-v %q ' "${CONTAINER_VOLUME_MAPPINGS[@]}") alpine:latest tail -f /dev/null
    done
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
    passthru docker rm -f "${CONTAINER_NAMES[@]}"
}

pause()
{
    passthru mutagen project pause
    passthru docker stop "${CONTAINER_NAMES[@]}"
}

resume()
{
    start_mutagen_daemon
    passthru docker start "${CONTAINER_NAMES[@]}"
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
