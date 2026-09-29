#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todomvc.spec.ts"
grep -q "\.hover()" "$FILE" || { echo "expected a .hover() call"; exit 1; }
grep -q "getByRole('button', { name: 'Delete' })" "$FILE" || { echo "expected getByRole('button', { name: 'Delete' })"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step4.log 2>&1
if ! grep -q "3 passed" /tmp/pw-step4.log; then
  echo "expected 3 passing tests"
  cat /tmp/pw-step4.log
  exit 1
fi

echo "Step 4 tests pass"
exit 0
