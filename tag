#!/bin/bash

set -e
set -x

HARNESSES=(php akeneo drupal8 magento1 magento2 spryker symfony wordpress)

SOURCE_BRANCH="0.10.x"
TAG_NAME="$1"

function main()
{
    local SOURCE_BRANCH="$1"
    local TAG_NAME="$2"

    for harness in "${HARNESSES[@]}"
    do
        clone "git@github.com:inviqa/harness-${harness}.git" "harness-${harness}"
        (
          cd "tmp-tag/harness-${harness}";
          git fetch "origin" "$SOURCE_BRANCH";
          git tag "$TAG_NAME" -m "v$TAG_NAME" "origin/$SOURCE_BRANCH";
          git push origin "$TAG_NAME"
        )
    done
}

function clone()
{
    local REMOTE_PATH="$1"
    local LOCAL_PATH="$2"

    mkdir -p tmp-tag/
    if [ -d "tmp-tag/${LOCAL_PATH}" ]; then
        return 0
    fi
    git clone "$REMOTE_PATH" "tmp-tag/$LOCAL_PATH"
}

main "$SOURCE_BRANCH" "$TAG_NAME"
