#!/bin/bash

function task_composer_development_dependencies()
{
    passthru composer install --no-interaction --optimize-autoloader --classmap-authoritative
    passthru composer generate
    run composer dump-autoload --optimize --classmap-authoritative
}
