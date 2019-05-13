#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function task_overlay_apply()
{
    run "rsync --exclude='*.twig' --exclude='_twig' -a /home/build/application/overlay/ /app/"
}
