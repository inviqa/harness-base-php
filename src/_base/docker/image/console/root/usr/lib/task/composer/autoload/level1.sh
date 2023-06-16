#!/bin/bash

function task_composer_autoload_level1()
{
    passthru composer dump-autoload --optimize
    run rm -rf /tmp/php-file-cache/*/app/vendor/composer /tmp/php-file-cache/*/app/vendor/autoload.php* || true
}
