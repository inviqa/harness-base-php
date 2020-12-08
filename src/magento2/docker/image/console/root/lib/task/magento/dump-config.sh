#!/bin/bash

function task_magento_dump-config()
{
    run cp /app/app/etc/env.php /app/app/etc/env.php.bak

    run magento app:config:dump
    run rm -rf /tmp/php-file-cache/*/app/app/etc/ || true
    run strip-magento-config

    run mv /app/app/etc/env.php.bak /app/app/etc/env.php
}
