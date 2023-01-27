#!/usr/bin/env bash

# shellcheck disable=SC2206
COMPOSE_BIN=($COMPOSE_BIN)

run "${COMPOSE_BIN[*]}" down --rmi local --volumes --remove-orphans --timeout 120

passthru ws cleanup built-images

run rm -f .my127ws/.flag-built .my127ws/.flag-console-built

passthru ws enable
