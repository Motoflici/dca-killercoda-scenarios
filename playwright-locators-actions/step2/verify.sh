#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todomvc.spec.ts"
[ -f "$FILE" ] || { echo "tests/todomvc.spec.ts not found"; exit 1; }
grep -q "getByRole('textbox'" "$FILE" || { echo "expected a getByRole('textbox', ...) locator"; exit 1; }
grep -q "getByText(" "$FILE" || { echo "expected a getByText(...) locator"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step2.log 2>&1
if ! grep -q "1 passed" /tmp/pw-step2.log; then
  echo "expected 1 passing test"
  cat /tmp/pw-step2.log
  exit 1
fi

echo "Step 2 test passes"
exit 0
