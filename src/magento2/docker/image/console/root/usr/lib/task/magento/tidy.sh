#!/bin/bash

function task_magento_tidy()
{
    rm -rf /app/.github
    rm -rf /app/phpserver

    rm -f /app/.htaccess
    rm -f /app/.htaccess.sample
    rm -f /app/.php_cs.dist
    rm -f /app/.travis.yml
    rm -f /app/.user.ini
    rm -f /app/auth.json.sample
    rm -f /app/CHANGELOG.md
    rm -f /app/COPYING.txt
    rm -f /app/grunt-config.json.sample
    rm -f /app/Gruntfile.js.sample
    rm -f /app/index.php
    rm -f /app/LICENSE_AFL.txt
    rm -f /app/LICENSE.txt
    rm -f /app/LICENSE_EE.txt
    rm -f /app/nginx.conf.sample
    rm -f /app/package.json.sample
    rm -f /app/php.ini.sample
    rm -f /app/README_EE.md
}
