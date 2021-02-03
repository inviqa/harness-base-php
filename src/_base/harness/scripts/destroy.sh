#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans --timeout 120

if [ "${DESTROY_ALL}" = yes ]; then
  passthru ws external-images rm --force
fi

if [ "${USE_MUTAGEN}" = yes ]; then
  run ws mutagen stop
  passthru ws mutagen rm
fi

passthru ws cleanup built-images

run rm -f .my127ws/.flag-built
