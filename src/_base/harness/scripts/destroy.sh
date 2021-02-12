#!/usr/bin/env bash

if [ "${DESTROY_ALL}" = yes ]; then
  RMI=all
else
  RMI=local
fi

run docker-compose down --rmi "${RMI}" --volumes --remove-orphans --timeout 120

if [ "${USE_MUTAGEN}" = yes ]; then
  run ws mutagen stop
  passthru ws mutagen rm
fi

passthru ws cleanup built-images

run rm -f .my127ws/{.flag-built,.flag-console-built}
