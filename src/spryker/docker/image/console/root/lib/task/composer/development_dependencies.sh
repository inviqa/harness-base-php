#!/bin/bash

function task_composer_development_dependencies()
{
    passthru "composer install --no-interaction --optimize-autoloader"
    passthru "composer devtools-setup"
    run "composer dump-autoload --optimize"
}
