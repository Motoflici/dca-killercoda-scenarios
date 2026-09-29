#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todomvc.spec.ts"
grep -q "toHaveCount(1)" "$FILE" || { echo "expected a toHaveCount(1) assertion"; exit 1; }
grep -q "toBeChecked()" "$FILE" || { echo "expected a toBeChecked() assertion"; exit 1; }
grep -q "not.toBeVisible()" "$FILE" || { echo "expected a .not.toBeVisible() assertion"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step5.log 2>&1
if ! grep -q "4 passed" /tmp/pw-step5.log; then
  echo "expected 4 passing tests"
  cat /tmp/pw-step5.log
  exit 1
fi

echo "All 4 tests pass"
exit 0
