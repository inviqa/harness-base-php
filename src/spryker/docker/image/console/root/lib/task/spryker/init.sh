#!/bin/bash

function task_spryker_init()
{
    run "vendor/bin/console propel:install -o"
    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -s jenkins-up"
}
