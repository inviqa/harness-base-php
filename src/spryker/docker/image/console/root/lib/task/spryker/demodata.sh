#!/bin/bash

function task_spryker_demodata()
{
    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker -s demodata"
}
