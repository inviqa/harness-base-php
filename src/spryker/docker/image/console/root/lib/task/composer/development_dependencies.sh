#!/bin/bash

function task_composer_development_dependencies()
{
    passthru php -d opcache.file_cache_only=0 /usr/bin/composer install --no-interaction --optimize-autoloader
    run rm -rf /tmp/php-file-cache/*/app/vendor/composer /tmp/php-file-cache/*/app/vendor/autoload.php* || true
    passthru composer generate
    task composer:autoload
}
