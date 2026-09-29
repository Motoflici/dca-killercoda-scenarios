#!/bin/bash

LOGFILE=/root/step3-verify.log
set -e

{
    date

    sleep 3
    docker service ls | grep web | grep "5/5"

} >> "${LOGFILE}" 2>&1

echo "done"
