#!/bin/bash

LOGFILE=/root/step2-verify.log
set -e

{
    date

    docker run --rm -v dca-vol:/data alpine cat /data/msg.txt | grep -q "hello from writer"

} >> "${LOGFILE}" 2>&1

echo "done"
