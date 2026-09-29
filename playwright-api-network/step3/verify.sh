#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/api.spec.ts"
grep -q "request.post(" "$FILE" || { echo "expected a request.post(...) call"; exit 1; }
grep -q "status()).toBe(201)" "$FILE" || { echo "expected a 201 status assertion"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test tests/api.spec.ts --reporter=line > /tmp/pw-step3.log 2>&1
if ! grep -q "2 passed" /tmp/pw-step3.log; then
  echo "expected 2 passing tests in api.spec.ts"
  cat /tmp/pw-step3.log
  exit 1
fi

echo "GET and POST tests both pass"
exit 0
