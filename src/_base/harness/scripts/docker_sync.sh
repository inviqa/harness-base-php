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

    if command -v sw_vers > /dev/null 2>&1 && sw_vers | grep -q Mac && command -v brew > /dev/null 2>&1; then
        passthru brew install rbenv
    else
        mkdir -p .my127ws/utilities/
        if [ ! -d .my127ws/utilities/rbenv ]; then
            git clone https://github.com/rbenv/rbenv.git .my127ws/utilities/rbenv
        fi
        mkdir -p "$(rbenv root)"/plugins
        git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    fi

    passthru rbenv install --skip-existing 2.7.0
    run rbenv local 2.7.0
    init_rbenv
)

init_rbenv()
{
    eval "$(rbenv init -)"
}

install_docker_sync()
(
    if command -v docker-sync > /dev/null 2>&1; then
        return 0
    fi

    install_rbenv
    passthru gem install docker-sync --no-document
)

start()
{
    install_docker_sync
    init_rbenv
    passthru docker-sync start
}

stop()
{
    init_rbenv
    passthru docker-sync stop
}

clean()
{
    init_rbenv
    run docker-sync stop
    run docker rm "${NAMESPACE}-sync"
}

case "$COMMAND" in
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
