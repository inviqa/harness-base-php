#!/usr/bin/env bash

# shellcheck disable=SC2206
COMPOSE_BIN=($COMPOSE_BIN)

if [[ "$USE_MUTAGEN" = "yes" ]]; then
    run ws mutagen pause
fi

run "${COMPOSE_BIN[@]}" stop
