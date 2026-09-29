#!/bin/bash

LOGFILE=/root/step3-verify.log
set -e

{
    date

    systemctl is-active docker

    ok=""
    for i in $(seq 1 10); do
        if docker info >/dev/null 2>&1; then
            ok="1"
            break
        fi
        sleep 1
    done
    test -n "${ok}"

} >> "${LOGFILE}" 2>&1

echo "done"
