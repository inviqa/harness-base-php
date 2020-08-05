#!/bin/bash

function task_assets_dump()
{
    local ASSETS_DIR="${ASSETS_DIR:-tools/assets/development}"

    if [ ! -d "/app/${ASSETS_DIR}" ]; then
        run mkdir -p "/app/${ASSETS_DIR}"
    fi

    if [ "${DB_PLATFORM}" == "mysql" ]; then
        run "mysqldump -h '${DB_HOST}' -u '${DB_USER}' '-p${DB_PASS}' '${DB_NAME}' | gzip > '/app/${ASSETS_DIR}/${DB_NAME}.sql.gz'"
    elif [ "${DB_PLATFORM}"  == "postgres" ]; then
        PGPASSWORD="$DB_PASS" run "pg_dump -h '${DB_HOST}' -U '${DB_USER}' '${DB_NAME}' | gzip > '/app/${ASSETS_DIR}/${DB_NAME}.sql.gz'"
    elif [ -n "${DB_PLATFORM}" ]; then
        (>&2 echo "invalid database type")
        exit 1
    fi
}
