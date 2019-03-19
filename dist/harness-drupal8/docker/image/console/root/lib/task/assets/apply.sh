#!/bin/bash

function task_assets_apply()
{
    local ASSETS_DIR="${ASSETS_DIR:-tools/assets/development}"

    SQL="SELECT IF (COUNT(*) = 0, 'no', 'yes') FROM information_schema.tables WHERE table_schema = '$DB_NAME';"
    IS_DATABASE_APPLIED="$(mysql -ss -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" -e "$SQL")"

    if [ "$IS_DATABASE_APPLIED" = "no" ]; then
        local DATABASE_FILE="/app/${ASSETS_DIR}/${DB_NAME}.sql.gz"
        if [ ! -f "$DATABASE_FILE" ]; then
            DATABASE_FILE="$(find "/app/${ASSETS_DIR}/" -maxdepth 1 -name "${DB_NAME}*.sql.gz" -print | head -n1)"
        fi

        if [ -f "$DATABASE_FILE" ]; then
            run "zcat $DATABASE_FILE | mysql -h $DB_HOST -u root -p$DB_ROOT_PASS $DB_NAME"
        else
            task "install"
        fi
    fi

    for file in "/app/${ASSETS_DIR}/"*.files.{tgz,tar.gz}; do
        [ -f "$file" ] || continue
        run "tar -xvf ${file} -C /app"
    done
}
