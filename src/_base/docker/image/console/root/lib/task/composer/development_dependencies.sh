#!/bin/bash

function task_composer_development_dependencies()
{
    passthru composer install --no-interaction --optimize-autoloader
}
