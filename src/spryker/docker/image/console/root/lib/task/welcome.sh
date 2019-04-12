#!/bin/bash

function task_welcome()
{
    echo ""
    echo "Welcome!"
    echo "--------"
    echo "Yves: https://${YVES_HOST}"
    echo "Zed: https://${ZED_HOST}"
    echo "  Username: admin@spryker.com"
    echo "  Password: change123"
    echo "Jenkins: https://${JENKINS_HOST_NAME}"
    echo ""
}
