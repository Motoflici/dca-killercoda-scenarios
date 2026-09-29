#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/api.spec.ts"
[ -f "$FILE" ] || { echo "tests/api.spec.ts not found"; exit 1; }
grep -q "request.get(" "$FILE" || { echo "expected a request.get(...) call"; exit 1; }
grep -q "jsonplaceholder.typicode.com" "$FILE" || { echo "expected the jsonplaceholder API URL"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test tests/api.spec.ts --reporter=line > /tmp/pw-step2.log 2>&1
if ! grep -q "1 passed" /tmp/pw-step2.log; then
  echo "expected the GET test to pass"
  cat /tmp/pw-step2.log
  exit 1
fi

echo "GET test passes"
exit 0
