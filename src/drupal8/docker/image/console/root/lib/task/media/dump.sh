#!/bin/bash

function task_media_dump()
{
    local ASSETS_DIR="${ASSETS_DIR:-tools/assets/development}"

    if [ ! -d "/app/${ASSETS_DIR}" ]; then
        run "mkdir -p /app/${ASSETS_DIR}"
    fi

    if [ ! -d "/app/docroot/sites/default/files" ]; then
        run "mkdir -p /app/docroot/sites/default/files"
    fi

    cd /app || exit
    tar -czf "/app/${ASSETS_DIR}/media.tgz" "docroot/sites/default/files" --exclude ".DS_Store"
}
