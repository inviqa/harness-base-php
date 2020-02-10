#!/bin/bash
script_args="$@"
# get environment variables to reload
IFS=$'\n'
env_vars="$(cat /app/env.sh)"
# get env vars into a one line string with values quoted
env_vars_single_line="$(cat /app/env.sh | sed 's/=\(.*\)/="\1"/' | paste -s -d" " -)"
# call the command passed to the script as the www-data user with environment variables preserved
# (the --preserve-envs option for sudo did not work with PHP $_ENV)
/usr/bin/env - "$env_vars" bash -c "sudo $env_vars_single_line -u www-data $script_args" > /proc/1/fd/1 2> /proc/1/fd/2
