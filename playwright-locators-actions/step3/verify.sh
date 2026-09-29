#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todomvc.spec.ts"
grep -q "\.filter({ hasText:" "$FILE" || { echo "expected a .filter({ hasText: ... }) call"; exit 1; }
grep -q "getByLabel('Toggle Todo')" "$FILE" || { echo "expected getByLabel('Toggle Todo')"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step3.log 2>&1
if ! grep -q "2 passed" /tmp/pw-step3.log; then
  echo "expected 2 passing tests"
  cat /tmp/pw-step3.log
  exit 1
fi

echo "Step 3 tests pass"
exit 0
