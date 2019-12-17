#!/bin/bash

function task_assets_apply()
{
    local ASSETS_DIR="${ASSETS_DIR:-tools/assets/development}"
    local IMPORT_COMMAND=""

    if [ "${DB_PLATFORM}" == "mysql" ]; then
        SQL="SELECT IF (COUNT(*) = 0, 'no', 'yes') FROM information_schema.tables WHERE table_schema = '$DB_NAME';"
        IS_DATABASE_APPLIED="$(mysql -ss -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "$SQL")"
        IMPORT_COMMAND="mysql -h $DB_HOST -u ${DB_ADMIN_USER:-$DB_USER} -p${DB_ROOT_PASS:-${DB_ADMIN_PASS:-$DB_PASS}} $DB_NAME"
    elif [ "${DB_PLATFORM}" == "postgres" ]; then
        SQL="SELECT CASE WHEN COUNT(*) = 0 THEN 'no' ELSE 'yes' END FROM information_schema.tables WHERE table_catalog = '$DB_NAME' and table_schema='public';"
        IS_DATABASE_APPLIED="$(PGPASSWORD="$DB_PASS" psql -qtAX -h "$DB_HOST" -U "$DB_USER" -c "$SQL")"
        IMPORT_COMMAND="PGPASSWORD=$DB_PASS psql -h $DB_HOST -U $DB_USER $DB_NAME"
    elif [ -n "${DB_PLATFORM}" ]; then
        (>&2 echo "invalid database type")
        exit 1
    fi

    if [ -n "${DB_PLATFORM}" ] && [ "$IS_DATABASE_APPLIED" = "no" ]; then
        local DATABASE_FILE="/app/${ASSETS_DIR}/${DB_NAME}.sql.gz"
        if [ ! -f "$DATABASE_FILE" ]; then
            DATABASE_FILE="$(find "/app/${ASSETS_DIR}/" -maxdepth 1 -name "${DB_NAME}*.sql.gz" -print | head -n1)"
        fi

        if [ -f "$DATABASE_FILE" ]; then
            passthru "pv --force $DATABASE_FILE | zcat - | $IMPORT_COMMAND"
        else
            task "install"
        fi
    fi

    for file in "/app/${ASSETS_DIR}/"*.files.{tgz,tar.gz}; do
        [ -f "$file" ] || continue
        run "tar -xvf ${file} -C /app"
    done
}
