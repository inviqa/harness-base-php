#!/bin/bash

function task_spryker_install()
{
    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -x frontend"
    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -s database-migrate"
    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -s demodata"
}
