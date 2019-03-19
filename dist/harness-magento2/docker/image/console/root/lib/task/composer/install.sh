#!/bin/bash

function task_composer_install()
{
    if [ "$APP_MODE" = "production" ]; then
        passthru "composer install --no-interaction --optimize-autoloader"
    else
        passthru "composer install --no-interaction"
    fi
}
