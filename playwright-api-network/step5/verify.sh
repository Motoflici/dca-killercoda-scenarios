#!/bin/bash
set -u

cd "$HOME/pw-lab" || exit 1
npx playwright test --reporter=line > /tmp/pw-step5.log 2>&1
if ! grep -q "3 passed" /tmp/pw-step5.log; then
  echo "expected 3 passing tests across api.spec.ts and network-mock.spec.ts"
  cat /tmp/pw-step5.log
  exit 1
fi

echo "Full suite passes: 3 passed"
exit 0
