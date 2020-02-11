#!/bin/bash
script_args="'$*'"
IFS=$'\n'
env_vars="$(cat /app/env.sh)"
/usr/bin/env - "$env_vars" su -s /bin/bash -p -c "$script_args" www-data > /proc/1/fd/1 2> /proc/1/fd/2
