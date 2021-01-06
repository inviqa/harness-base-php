#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans

if [[ "$USE_DOCKER_SYNC" = "yes" ]] && [ -f docker-sync.yml ]; then
  run ws docker-sync clean
  run docker volume rm "${NAMESPACE}-sync"
elif [[ "$USE_MUTAGEN" = "yes" ]]; then
  run ws mutagen stop
  passthru ws mutagen rm
fi

if [[ "$APP_BUILD" = "static" ]]; then
    DOCKER_IMAGE_REFERENCE="${DOCKER_REPOSITORY}:${APP_VERSION}"
    if [[ "$DOCKER_REPOSITORY" =~ ':' ]]; then
      DOCKER_IMAGE_REFERENCE="${DOCKER_REPOSITORY}${APP_VERSION}"
    fi
    run "docker images --filter=since='${DOCKER_IMAGE_REFERENCE}-console' -q | xargs --no-run-if-empty docker image rm --force"
    run "docker images --filter=reference='${DOCKER_IMAGE_REFERENCE}-*' -q | xargs --no-run-if-empty docker image rm --force"
fi
run "docker images --filter=since='${NAMESPACE}-*:dev' -q | xargs --no-run-if-empty docker image rm --force"
run "docker images --filter=reference='${NAMESPACE}-*:dev' -q | xargs --no-run-if-empty docker image rm --force"

run rm -f .my127ws/.flag-built
