#!/bin/bash

# Validator contract: exit 0 and print ONLY "done" on success.
# Anything else on stdout is treated as a failure message.

LOGFILE=/root/step1-verify.log
set -e

{
    date

    docker info --format '{{.Swarm.LocalNodeState}}' | grep -i active
    docker node ls | grep -i leader

} >> "${LOGFILE}" 2>&1

echo "done"
