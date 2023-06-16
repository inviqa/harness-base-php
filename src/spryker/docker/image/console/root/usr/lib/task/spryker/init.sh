#!/bin/bash

function task_spryker_init()
{
    run vendor/bin/console propel:install -o
    PGPASSWORD="$DB_PASS" passthru vendor/bin/install -r docker -s jenkins-up
}
