#!/bin/bash
IFS=$'\n'
env_vars="$(cat /app/env.sh)"
/usr/bin/env - $env_vars "$@" > /proc/1/fd/1 2> /proc/1/fd/2
