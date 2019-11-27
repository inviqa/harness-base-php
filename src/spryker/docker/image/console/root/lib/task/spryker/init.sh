#!/bin/bash

function task_spryker_init()
{
    passthru "vendor/bin/install -r docker -s queue-flush"

    task "assets:apply" # calls task "install" when database is not applied

    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -s queue-worker"
    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -s jenkins-up"
}
