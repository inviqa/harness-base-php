#!/bin/bash

# wait for http service
function task_http_wait() {
    echo -e "Waiting for http service $1 to be available"

    local counter=0

    while ! curl --fail --silent --show-error --location --insecure --output /dev/null "$1"; do

        if (( counter > 60 )); then
            (>&2 echo "timeout while waiting on $1 to become available")
            exit 1
        fi

        sleep 1
        ((++counter))
    done
}