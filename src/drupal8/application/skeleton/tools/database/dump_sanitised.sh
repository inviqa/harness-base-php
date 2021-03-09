#!/usr/bin/env bash

set -e -o pipefail

curl --fail --silent --show-error --location --output /tmp/mtk-dump https://github.com/skpr/mtk/releases/download/v0.0.1/mtk-dump_linux_amd64
chmod +x /tmp/mtk-dump

if [ -L "$0" ] ; then
    DIR="$(dirname "$(readlink -f "$0")")" ;
else
    DIR="$(dirname "$0")" ;
fi

BACKUP_FILE="/app/tools/assets/development/dump_sanitised.sql"

/tmp/mtk-dump \
--config=$DIR/mtk.config.yml \
--host=$DB_HOST \
--user=$DB_USER \
--password=$DB_PASS \
$DB_NAME > $BACKUP_FILE