#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todo-fixture.spec.ts"
[ -f "$FILE" ] || { echo "tests/todo-fixture.spec.ts not found"; exit 1; }
grep -q "from '../fixtures'" "$FILE" || { echo "expected tests to import from '../fixtures'"; exit 1; }
grep -q "todoPage" "$FILE" || { echo "expected the tests to use the todoPage fixture"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step5.log 2>&1
if ! grep -q "4 passed" /tmp/pw-step5.log; then
  echo "expected 4 passing tests (2 flat + 2 fixture-based)"
  cat /tmp/pw-step5.log
  exit 1
fi

echo "Flat and fixture-based suites both pass: 4 passed"
exit 0
