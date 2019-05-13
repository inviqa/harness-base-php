#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function task_composer_install()
{
    passthru "composer install --no-interaction"
}
