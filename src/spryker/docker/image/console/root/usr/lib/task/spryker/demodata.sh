#!/bin/bash

function task_spryker_demodata()
{
    PGPASSWORD=$DB_PASS passthru vendor/bin/install -r docker -s demodata
}
