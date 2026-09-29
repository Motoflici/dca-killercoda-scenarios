#!/bin/bash

LOGFILE=/root/step3-verify.log
set -e

{
    date

    MP=$(docker volume inspect dca-vol --format '{{.Mountpoint}}')
    test -f "${MP}/msg.txt"
    grep -q "hello from writer" "${MP}/msg.txt"

} >> "${LOGFILE}" 2>&1

echo "done"
