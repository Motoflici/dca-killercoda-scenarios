#!/bin/bash

LOGFILE=/root/step2-verify.log
set -e

{
    date

    docker history dca-app:single | grep -qi golang

} >> "${LOGFILE}" 2>&1

echo "done"
