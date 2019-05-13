#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

function task_welcome()
{
    echo ""
    echo "Welcome!"
    echo "--------"
    echo "URL: https://${APP_HOST}"
    echo "Admin: /admin"
    echo "  Username: admin"
    echo "  Password: admin123"
    echo ""
}
