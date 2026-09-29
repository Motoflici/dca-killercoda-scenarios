#!/bin/bash

LOGFILE=/root/step2-verify.log
set -e

{
    date

    docker image inspect docker/trusttest:latest >/dev/null
    docker trust inspect --pretty docker/trusttest:latest | grep -qi "SIGNED TAG"

} >> "${LOGFILE}" 2>&1

echo "done"
