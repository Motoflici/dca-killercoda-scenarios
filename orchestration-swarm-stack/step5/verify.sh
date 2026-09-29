#!/bin/bash

LOGFILE=/root/step5-verify.log
set -e

{
    date

    sleep 8
    docker stack services dca | grep "dca_web" | grep "3/3"
    docker stack services dca | grep "dca_cache" | grep "1/1"

} >> "${LOGFILE}" 2>&1

echo "done"
