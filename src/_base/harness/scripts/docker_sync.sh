#!/usr/bin/env bash

set -e -o pipefail

if [ "$#" -ne 1 ]; then
    echo "This script supports only one parameter"
    exit 1
fi

COMMAND="$1"
PATH="$PATH:./.my127ws/utilities/rbenv/bin/"

install_rbenv()
(
    if command -v rbenv > /dev/null 2>&1; then
        return 0
    fi

    if sw_vers | grep -q Mac; then
        passthru brew install rbenv
    else
        mkdir -p .my127ws/utilities/
        if [ ! -d .my127ws/utilities/rbenv ]; then
            git clone https://github.com/rbenv/rbenv.git .my127ws/utilities/rbenv
        fi
        mkdir -p "$(rbenv root)"/plugins
        git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    fi

    rbenv install --skip-existing 2.7.0
    rbenv local 2.7.0
)

install_docker_sync()
(
    if command -v docker-sync > /dev/null 2>&1; then
        return 0
    fi

    install_rbenv
    gem install docker-sync --no-document
)

start()
{
    install_docker_sync

    passthru docker-sync start
}

stop()
{
    passthru docker-sync stop
    run docker rm "${NAMESPACE}-sync"
}

clean()
{
    passthru docker-sync stop
    passthru docker-sync clean
}

case $COMMAND in
    start)
        start
        ;;
    stop)
        stop
        ;;
    clean)
        clean
        ;;
    *)
        echo "Command not supported"
        exit 1
        ;;
esac
