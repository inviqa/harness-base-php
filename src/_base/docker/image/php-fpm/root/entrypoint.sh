#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
# run
exec supervisord -c /etc/supervisor/supervisord.conf -n
