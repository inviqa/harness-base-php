#!/bin/bash

function task_composer_autoload_level2()
{
    passthru composer dump-autoload --optimize --classmap-authoritative
    run rm -rf /tmp/php-file-cache/*/app/vendor/composer /tmp/php-file-cache/*/app/vendor/autoload.php* || true
}
