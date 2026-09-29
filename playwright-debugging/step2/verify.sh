#!/bin/bash
set -u

FILE="$HOME/pw-lab/tests/todomvc.spec.ts"
[ -f "$FILE" ] || { echo "tests/todomvc.spec.ts not found"; exit 1; }
grep -q "toHaveCount(2)" "$FILE" || { echo "expected the deliberately wrong toHaveCount(2) assertion"; exit 1; }

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step2.log 2>&1
if ! grep -q "1 failed" /tmp/pw-step2.log; then
  echo "expected the test to genuinely fail at this point"
  cat /tmp/pw-step2.log
  exit 1
fi

echo "The test fails as expected -- on to diagnosing it"
exit 0
