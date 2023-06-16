#!/bin/bash

function task_jenkins()
{
    echo "Deprecated: call app jenkins:$1 directly" >&2
    task "jenkins:$1"
}
