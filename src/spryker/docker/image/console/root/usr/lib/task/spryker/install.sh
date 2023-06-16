#!/bin/bash

function task_spryker_install()
{
    PGPASSWORD="$DB_PASS" passthru vendor/bin/install -r docker -x frontend -x clear -x generate -x cache
}
