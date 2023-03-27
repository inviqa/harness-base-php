#!/bin/bash

function task_composer_autoload_level0()
{
    passthru composer dump-autoload
    run rm -rf /tmp/php-file-cache/*/app/vendor/composer /tmp/php-file-cache/*/app/vendor/autoload.php* || true
}
