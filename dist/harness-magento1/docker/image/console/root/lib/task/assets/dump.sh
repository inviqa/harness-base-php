#!/bin/bash

function task_assets_dump()
{
    local ASSETS_DIR="${ASSETS_DIR:-tools/assets/development}"

    if [ ! -d "/app/${ASSETS_DIR}" ]; then
        run "mkdir -p /app/${ASSETS_DIR}"
    fi

    run "mysqldump -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} | gzip > /app/${ASSETS_DIR}/${DB_NAME}.sql.gz"
}
