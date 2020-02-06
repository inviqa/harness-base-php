#!/bin/bash

# this is used to load env vars in crontab commands
env > /app/env.sh

# run
crontab -u www-data /crontab
exec cron -f -L 15