#!/bin/bash

function db_hasSchema()
{
    if [ "${DB_PLATFORM}" == "mysql" ]; then
        SQL="SELECT IF (COUNT(*) = 0, 'no', 'yes') FROM information_schema.tables WHERE table_schema = '$DB_NAME';"
        IS_DATABASE_APPLIED="$(mysql -ss -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "$SQL")"
    elif [ "${DB_PLATFORM}" == "postgres" ]; then
        SQL="SELECT CASE WHEN COUNT(*) = 0 THEN 'no' ELSE 'yes' END FROM information_schema.tables WHERE table_catalog = '$DB_NAME' and table_schema='public';"
        IS_DATABASE_APPLIED="$(PGPASSWORD="$DB_PASS" psql -qtAX -h "$DB_HOST" -U "$DB_USER" -c "$SQL")"
    elif [ -n "${DB_PLATFORM}" ]; then
        (>&2 echo "invalid database type")
        exit 1
    fi

    if [ -n "${DB_PLATFORM}" ] && [ "$IS_DATABASE_APPLIED" = "no" ]; then
        return 1
    fi

    return 0
}
