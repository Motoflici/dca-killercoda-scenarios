#!/bin/bash

LOGFILE=/root/step2-verify.log
set -e

{
    date

    sleep 3
    docker service ls | grep web | grep "3/3"
    test "$(docker service ps web --filter 'desired-state=running' -q | wc -l)" -eq 3

} >> "${LOGFILE}" 2>&1

echo "done"
