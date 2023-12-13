#!/bin/bash

function task_searchengine_available()
{
    if [ -n "${SEARCHENGINE_PLATFORM:-}" ]; then
        task http:wait "${SEARCHENGINE_URL:-${SEARCHENGINE_SCHEME:-http}://${SEARCHENGINE_HOST}:${SEARCHENGINE_PORT}}" ${SEARCHENGINE_USERNAME:+--user "${SEARCHENGINE_USERNAME}:${SEARCHENGINE_PASSWORD}"}
    fi
}
