#!/bin/bash

function task_composer_development_dependencies()
{
    passthru php -d opcache.file_cache_only=0 /usr/bin/composer install --no-interaction
    run rm -rf /tmp/php-file-cache/*/app/vendor/composer /tmp/php-file-cache/*/app/vendor/autoload.php* || true
    passthru magento setup:upgrade --keep-generated
    passthru magento setup:di:compile
    task composer:autoload
}
