#!/bin/bash

function task_mysql_available()
{
    local counter=0

    while [ ! "$(mysqladmin -h "$DB_HOST" -u root -p"$DB_ROOT_PASS" ping 2> /dev/null)" ]; do
        
        if (( counter > 30 )); then
            (>&2 echo "timeout while waiting on mysql to become available")
            exit 1
        fi

        sleep 1
        ((++counter))
    done
}
