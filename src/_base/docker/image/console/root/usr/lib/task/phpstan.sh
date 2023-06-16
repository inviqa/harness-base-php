#!/bin/bash

function task_phpstan()
{
    local phpstan_version=""
    phpstan_version="$(find_phpstan_version)"

    echo "Using phpstan v$phpstan_version"
    composer global require "phpstan/phpstan:$phpstan_version"
    composer global exec -v -- phpstan analyse -c /app/phpstan.neon
}

function find_phpstan_version()
(
    local phpstan_version="0.12.37"
    local project_phpstan_version=""
    set +e
    if [ -f /app/composer.lock ]; then
        project_phpstan_version="$(jq -r '."packages" + ."packages-dev" | map(select( .name == "phpstan/phpstan" )) | .[].version' /app/composer.lock)"
        if [ -n "$project_phpstan_version" ]; then
          phpstan_version="$project_phpstan_version"
        fi
    fi
    echo "$phpstan_version"
)
