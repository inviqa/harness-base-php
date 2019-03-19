#!/bin/bash

function task_skeleton_apply()
{
    run "rsync --exclude='*.twig' --exclude='_twig' -a /home/build/application/skeleton/ /app/"
}
