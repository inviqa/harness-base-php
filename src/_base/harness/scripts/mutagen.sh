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
# shellcheck disable=SC2206
SYNC_NAMES=($SYNC_NAMES)
# shellcheck disable=SC2206
FORWARD_NAMES=($FORWARD_NAMES)

install_mutagen()
{
    if command -v mutagen > /dev/null 2>&1; then
        return 0
    fi

    if command -v sw_vers > /dev/null 2>&1 && sw_vers | grep -qi Mac && command -v brew > /dev/null 2>&1; then
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

    run curl --fail --silent --show-error --location --output .my127ws/utilities/mutagen/mutagen.tar.gz "$download_url"
    run "cd .my127ws/utilities/mutagen/ && tar -xf mutagen.tar.gz"
}

setup_sync_container()
{
    local CONTAINER_NAME
    local CONTAINER_VOLUME_MAPPINGS
    local line
    for CONTAINER_NAME in "${CONTAINER_NAMES[@]}"; do
        if [[ "$(docker ps --all --filter "name=${CONTAINER_NAME}\$" --format '{{.Names}}')" == "${CONTAINER_NAME}" ]]; then
            passthru docker start "${CONTAINER_NAME}"
        else
            CONTAINER_VOLUME_MAPPINGS=()
            while IFS= read -r line; do
                CONTAINER_VOLUME_MAPPINGS+=("$line")
            done < <(echo "${VOLUME_MAPPINGS}" | grep "^${CONTAINER_NAME}" | cut -d ':' -f2- )

            # shellcheck disable=SC2046
            passthru docker run -d --init --name "${CONTAINER_NAME}" $(printf -- '-v %q ' "${CONTAINER_VOLUME_MAPPINGS[@]}") alpine:latest tail -f /dev/null
        fi
    done
}

start_mutagen_daemon()
{
    passthru mutagen daemon start
}

join_by_character()
(
  local IFS="$1"
  shift
  echo "$*"
)

clean_existing_projects()
{
    # Clean up the project if it's running
    if mutagen project list > /dev/null 2>&1; then
        passthru mutagen project terminate
    fi

    declare -a EXISTING_PROJECT_LABELS=()

    local SYNC_NAME
    local SYNC_LIST
    for SYNC_NAME in "${SYNC_NAMES[@]}"; do
        # List syncs based on name
        SYNC_LIST="$(mutagen sync list "$SYNC_NAME" 2> /dev/null || true)"
        # Check if there are entries left
        if [ "$(echo "$SYNC_LIST" | grep --count "URL: $(pwd)" | awk '{ print $1 }')" -gt 0 ]; then
            # Build an array of sync session IDs to clean up
            while IFS='' read -r line; do EXISTING_PROJECT_LABELS+=("$line"); done < <(echo "$SYNC_LIST" | grep -B4 "URL: $(pwd)" | grep io.mutagen.project | awk '{print $1"="$2}' | sed s/:=/=/)
        fi
    done

    local FORWARD_NAME
    local FORWARD_LIST
    local CONTAINER_NAMES_REGEX
    CONTAINER_NAMES_REGEX="$(join_by_character "\|" "${CONTAINER_NAMES[@]}")"
    for FORWARD_NAME in "${FORWARD_NAMES[@]}"; do
        # List forwards based on name
        FORWARD_LIST="$(mutagen forward list "$FORWARD_NAME" 2> /dev/null || true)"
        # Check if there are entries left
        if [ "$(echo "$FORWARD_LIST" | grep --count "URL: docker://\($CONTAINER_NAMES_REGEX\):tcp:" | awk '{ print $1 }')" -gt 0 ]; then
            # Build an array of sync session IDs to clean up
            while IFS='' read -r line; do EXISTING_PROJECT_LABELS+=("$line"); done < <(echo "$FORWARD_LIST" | grep -B6 "URL: docker://\($CONTAINER_NAMES_REGEX\):tcp:" | grep io.mutagen.project | awk '{print $1"="$2}' | sed s/:=/=/)
        fi
    done

    if [ "${#EXISTING_PROJECT_LABELS[@]}" -gt 0 ]; then
        echo "Found multiple mutagen sessions for this project."
        echo "This can lead to increased CPU usage."
        local REPLY=""
        if [ -t 0 ] ; then
          read -r -p 'Do you want to remove the other sessions? [Yes]/no: ' REPLY
        fi
        REPLY="${REPLY:-Yes}"
        if ! [[ "$REPLY" =~ ^(Y|Yes|y|yes)$ ]]; then
          return
        fi

        local LABEL_SELECTOR
        for LABEL_SELECTOR in "${EXISTING_PROJECT_LABELS[@]}"; do
          passthru mutagen sync terminate --label-selector "${LABEL_SELECTOR}"
          passthru mutagen forward terminate --label-selector "${LABEL_SELECTOR}"
        done
    fi
}

start()
{
    install_mutagen
    setup_sync_container
    start_mutagen_daemon

    clean_existing_projects
    passthru mutagen project start
    passthru mutagen project flush
}

stop()
{
    passthru mutagen project terminate
    clean_existing_projects
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
