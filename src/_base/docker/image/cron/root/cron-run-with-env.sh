#!/bin/bash
IFS=$'\n'
env_vars="$(cat /app/env.sh)"
env_vars_single_line="$(cat /app/env.sh | sed 's/=\(.*\)/="\1"/' | paste -s -d" " -)"
script_args="$@"
/usr/bin/env - "$env_vars" bash -c "sudo $env_vars_single_line -u www-data $script_args"