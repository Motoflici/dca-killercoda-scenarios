#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todomvc.spec.ts"
[ -f "$FILE" ] || { echo "tests/todomvc.spec.ts not found"; exit 1; }

if grep -q "toHaveCount(2)" "$FILE"; then
  echo "the buggy toHaveCount(2) assertion is still present"
  exit 1
fi

grep -q "toHaveCount(3)" "$FILE" || { echo "expected toHaveCount(3) after the fix"; exit 1; }

echo "Fix applied"
exit 0
