#!/bin/bash

function task_spryker_migrate()
{
    passthru "vendor/bin/console propel:migrate"
}
