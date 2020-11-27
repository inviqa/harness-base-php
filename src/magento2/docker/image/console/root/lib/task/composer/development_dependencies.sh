#!/bin/bash

function task_composer_development_dependencies()
{
    passthru composer install --no-interaction --optimize-autoloader
    passthru magento setup:upgrade
    passthru magento setup:di:compile
    passthru composer dump-autoload --optimize --classmap-authoritative
}
