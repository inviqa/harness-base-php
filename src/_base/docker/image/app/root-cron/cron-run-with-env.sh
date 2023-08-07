#!/bin/bash
script_args="$*"
env_vars=()
readarray -t env_vars < /app/env.sh
/usr/bin/env - "${env_vars[@]}" su -s /bin/bash -p -c "$script_args" www-data > /proc/1/fd/1 2> /proc/1/fd/2
