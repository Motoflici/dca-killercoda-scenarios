#!/bin/bash

LOGFILE=/root/step6-verify.log
set -e

{
    date

    docker stack ps dca | grep "dca_web"
    docker stack ps dca | grep "dca_cache"
    test "$(docker service ps dca_web --filter 'desired-state=running' -q | wc -l)" -eq 3
    test "$(docker service ps dca_cache --filter 'desired-state=running' -q | wc -l)" -eq 1

} >> "${LOGFILE}" 2>&1

echo "done"
