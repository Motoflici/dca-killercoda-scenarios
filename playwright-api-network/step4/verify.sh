#!/bin/bash
set -u

[ -f "$HOME/pw-lab/public/index.html" ] || { echo "public/index.html not found"; exit 1; }

FILE="$HOME/pw-lab/tests/network-mock.spec.ts"
[ -f "$FILE" ] || { echo "tests/network-mock.spec.ts not found"; exit 1; }
grep -q "page.route(" "$FILE" || { echo "expected a page.route(...) call"; exit 1; }
grep -q "route.fulfill(" "$FILE" || { echo "expected a route.fulfill(...) call"; exit 1; }
grep -q "Mock McMockface" "$FILE" || { echo "expected the mocked name to appear in the test"; exit 1; }

if ! curl -fsS "http://localhost:8000" >/dev/null 2>&1; then
  echo "local static server on :8000 is not reachable -- start it before running this step"
  exit 1
fi

cd "$HOME/pw-lab" || exit 1
npx playwright test tests/network-mock.spec.ts --reporter=line > /tmp/pw-step4.log 2>&1
if ! grep -q "1 passed" /tmp/pw-step4.log; then
  echo "expected the network mock test to pass"
  cat /tmp/pw-step4.log
  exit 1
fi

echo "Network mock test passes"
exit 0
