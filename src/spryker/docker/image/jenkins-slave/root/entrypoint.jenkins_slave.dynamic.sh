#!/bin/bash

source /jenkins_slave.sh

main()
{
    source /entrypoint.dynamic.sh
}

bootstrap
main
