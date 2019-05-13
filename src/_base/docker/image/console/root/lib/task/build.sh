#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function task_build()
{
    if [ ! -f /app/composer.json ]; then
        task "skeleton:apply"
    fi

    task "overlay:apply"

    task "build:backend"
    task "build:frontend"
}
