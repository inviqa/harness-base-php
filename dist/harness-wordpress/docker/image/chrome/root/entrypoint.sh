#!/bin/bash

# make linux consistent with docker-for-mac
if [ "${HOST_OS_FAMILY}" = "linux" ]; then
    DOCKER_INTERNAL_HOST="host.docker.internal"
    if ! grep $DOCKER_INTERNAL_HOST /etc/hosts > /dev/null ; then
        DOCKER_INTERNAL_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
        echo -e "$DOCKER_INTERNAL_IP    $DOCKER_INTERNAL_HOST" | tee -a /etc/hosts > /dev/null
    fi
fi

# we always want to resolve the app host to traefik
if ! grep "$APP_HOST" /etc/hosts > /dev/null ; then
    DOCKER_INTERNAL_IP=$(getent hosts host.docker.internal | cut -d" " -f1 | head -n1)
    echo -e "$DOCKER_INTERNAL_IP    $APP_HOST" | tee -a /etc/hosts > /dev/null
fi

/usr/bin/dumb-init -- /usr/bin/google-chrome-unstable \
  --no-sandbox \
  --disable-gpu \
  --headless \
  --disable-dev-shm-usage \
  --remote-debugging-address=0.0.0.0 \
  --remote-debugging-port=9222 \
  --user-data-dir=/data \
  "$@"
