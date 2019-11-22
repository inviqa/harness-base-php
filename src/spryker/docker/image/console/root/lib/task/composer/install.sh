#!/bin/bash

function task_composer_install()
{
    passthru "composer install --no-interaction --no-dev --optimize-autoloader --classmap-authoritative"
}
