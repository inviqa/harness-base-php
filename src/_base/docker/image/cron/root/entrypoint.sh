#!/bin/bash

# this is used to load env vars in crontab commands
env > /app/env.sh

# run
crontab /crontab
exec /sbin/docker-init -- cron -f -L 15
