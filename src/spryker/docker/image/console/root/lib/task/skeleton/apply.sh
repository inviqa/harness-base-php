#!/bin/bash

function task_skeleton_apply()
{
    if [ ! -f /app/composer.json ]; then
        fetch_demoshop
    fi
    run "rsync --exclude='*.twig' --exclude='_twig' -a /home/build/application/skeleton/ /app/"
}

function fetch_demoshop()
{
    run "git clone ${DEMOSHOP_URL} /tmp/spryker"
    run "shopt -s dotglob && mv /tmp/spryker/* /app"
    run "rm -rf /tmp/spryker"
    run "rm -rf /app/.git"
}