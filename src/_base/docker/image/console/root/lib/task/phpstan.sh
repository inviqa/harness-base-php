#!/bin/bash

function task_phpstan()
{
    local phpstan_version=""
    phpstan_version="$(find_phpstan_version)"

    echo "Using phpstan v$phpstan_version"
    if [ ! -f "/app/vendor/bin/phpstan-$phpstan_version.phar" ]; then
        curl -o "/app/vendor/bin/phpstan-$phpstan_version.phar" -L -f -sS "https://github.com/phpstan/phpstan/releases/download/$phpstan_version/phpstan.phar"
    fi
    cd /app || return 1
    php "/app/vendor/bin/phpstan-$phpstan_version.phar" analyse
}

function find_phpstan_version()
(
    local phpstan_version="0.12.30"
    local project_phpstan_version=""
    set +e
    if [ -f /app/composer.lock ]; then
        project_phpstan_version="$(jq -r '(."packages-dev"[] | select( .name == "phpstan/phpstan" )).version' < /app/composer.lock)"
        if [ -n "$project_phpstan_version" ]; then
          phpstan_version="$project_phpstan_version"
        fi
    fi
    echo "$phpstan_version"
)
