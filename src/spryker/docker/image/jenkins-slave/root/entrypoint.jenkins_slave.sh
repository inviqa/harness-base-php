#!/bin/bash

source /jenkins_slave.sh

main()
{
    source /entrypoint.sh
}

bootstrap
main
