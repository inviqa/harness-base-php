#!/usr/bin/env bash

run docker-compose -p "$NAMESPACE" down --rmi local --volumes --remove-orphans

if [[ "$USE_DOCKER_SYNC" = "yes" ]]; then
  run docker-sync stop
  run docker rm "${NAMESPACE}-sync"
  run docker volume rm "${NAMESPACE}-sync"
fi

run rm -f .flag-built
