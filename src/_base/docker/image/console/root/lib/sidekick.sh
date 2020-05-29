#!/bin/bash

VERBOSE="no"

RUN_CWD=""

INDICATOR_RUNNING="34m"
INDICATOR_SUCCESS="32m"
INDICATOR_ERROR="31m"
INDICATOR_PASSTHRU="37m"

TASKS="/lib/task"

task()
{
    local task_file="${TASKS}/${1//:/\/}.sh"
    local task_name="task_${1//:/_}"

    # shellcheck source=/dev/null
    declare -F "$task_name" &>/dev/null || source "$task_file"

    shift

    $task_name "$@"
}

prompt()
{
    if [ "${RUN_CWD}" != "$(pwd)" ]; then
        RUN_CWD="$(pwd)"
        echo -e "\\033[1m[\\033[0mdocker(console):$(pwd)\\033[1m]:\\033[0m"
    fi
}

run()
{
    local COMMAND="$*"
    if [ "$VERBOSE" = "no" ]; then
        prompt

        echo "  > ${COMMAND[*]}"
        setCommandIndicator "$INDICATOR_RUNNING"

        if ! bash -c "${COMMAND[@]}" > /tmp/my127ws-stdout.txt 2> /tmp/my127ws-stderr.txt; then
            setCommandIndicator "$INDICATOR_ERROR"

            if [ "$APP_BUILD" = "static" ]; then
              echo "Command failed. stdout:"
              cat /tmp/my127ws-stdout.txt
              echo
              echo "stderr:"
              cat /tmp/my127ws-stderr.txt
              echo
            else
              echo "Command failed. stderr:"
              cat /tmp/my127ws-stderr.txt
              echo "----------------------------------"
              echo "Full logs are accessible in the console container at path :-"
              echo "  stdout: /tmp/my127ws-stdout.txt"
              echo "  stderr: /tmp/my127ws-stderr.txt"
            fi

            exit 1
        else
            setCommandIndicator "$INDICATOR_SUCCESS"
        fi
    else
        passthru "${COMMAND[@]}"
    fi
}

passthru()
{
    prompt

    echo -e "\\033[${INDICATOR_PASSTHRU}■\\033[0m > $*"

    if ! bash -c "$@"; then
        exit 1
    fi
}

setCommandIndicator()
{
    echo -ne "\\033[1A";
    echo -ne "\\033[$1"
    echo -n "■"
    echo -ne "\\033[0m"
    echo -ne "\\033[1E";
}
