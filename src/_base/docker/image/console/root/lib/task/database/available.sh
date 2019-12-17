#!/bin/bash

function task_database_available()
{
    local command=""

    if [ "${DB_PLATFORM}" == "mysql" ]; then
        command="mysqladmin -h $DB_HOST -u ${DB_ADMIN_USER:-$DB_USER} -p${DB_ROOT_PASS:-${DB_ADMIN_PASS:-$DB_PASS}} ping --connect_timeout=10"
    elif [ "${DB_PLATFORM}" == "postgres" ]; then
        command="pg_isready -h $DB_HOST"
    elif [ "${DB_PLATFORM}" == "" ]; then
        # no database is used
        return
    else
        (>&2 echo "invalid database type")
        exit 1
    fi

    local counter=0

    while ! $command &> /dev/null; do

        if (( counter > 8 )); then
            (>&2 echo "timeout while waiting on ${DB_PLATFORM} to become available")
            exit 1
        fi

        sleep 1
        ((++counter))
    done
}
