#!/bin/bash

LOGFILE=/root/step5-verify.log
set -e

{
    date

    # dca-vol must survive (still referenced by dca-keepalive)
    docker volume ls | grep -q dca-vol
    # dca-scratch must be gone (unused, named, prune --all target)
    if docker volume ls | grep -q dca-scratch; then
        echo "dca-scratch was not pruned" >&2
        exit 1
    fi

    # the tagged image must survive
    docker images dca-scratch-image:latest --format '{{.Repository}}' | grep -q dca-scratch-image
    # no dangling images should remain
    test -z "$(docker images --filter dangling=true -q)"

} >> "${LOGFILE}" 2>&1

echo "done"
