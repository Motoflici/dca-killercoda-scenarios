#!/bin/bash
set -u

cd "$HOME/pw-lab" || exit 1

TRACE=$(find test-results -name trace.zip 2>/dev/null | head -n1)
if [ -z "$TRACE" ]; then
  echo "no trace.zip found under test-results/ -- run the failing test at least once with trace: 'on'"
  exit 1
fi

echo "Found trace: $TRACE"
exit 0
