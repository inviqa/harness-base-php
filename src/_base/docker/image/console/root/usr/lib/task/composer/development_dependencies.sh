#!/bin/bash

function task_composer_development_dependencies()
{
    passthru php -d opcache.file_cache_only=0 /usr/bin/composer install --no-interaction --optimize-autoloader
    task composer:autoload
}
