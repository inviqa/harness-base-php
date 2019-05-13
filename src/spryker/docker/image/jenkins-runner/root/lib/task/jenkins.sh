#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function task_jenkins()
{
    task "jenkins:$1"
}
