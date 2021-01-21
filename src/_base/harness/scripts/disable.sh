#!/usr/bin/env bash

if [[ "$USE_MUTAGEN" = "yes" ]]; then
    run ws mutagen pause
fi

run docker-compose stop
