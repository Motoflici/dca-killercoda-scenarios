To mock a network response you need a page that actually makes one. Let's build a tiny real page that fetches a user's name from the same public API, client-side, and renders it:

```
cat > ~/pw-lab/public/index.html << 'HTML_EOF'
<!doctype html>
<html>
<head><meta charset="utf-8"><title>Mini Profile</title></head>
<body>
  <h1 id="username">Loading...</h1>
  <script>
    fetch('https://jsonplaceholder.typicode.com/users/1')
      .then((res) => res.json())
      .then((user) => {
        document.getElementById('username').textContent = user.name;
      });
  </script>
</body>
</html>
HTML_EOF
```{{exec}}

Serve it locally in the background:

```
cd ~/pw-lab && python3 -m http.server 8000 --directory public > /tmp/http-server.log 2>&1 &
```{{exec}}

Now write a UI test that intercepts that exact `fetch()` call with **`page.route()`** and answers it with fake data of our own, using `route.fulfill()`:

```
cat > ~/pw-lab/tests/network-mock.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test('mocks the network response so fake data renders', async ({ page }) => {
  await page.route('https://jsonplaceholder.typicode.com/users/1', (route) => {
    route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify({ id: 1, name: 'Mock McMockface' }),
    });
  });

  await page.goto('http://localhost:8000');

  await expect(page.locator('#username')).toHaveText('Mock McMockface');
});
SPEC_EOF
```{{exec}}

Run it:

```
cd ~/pw-lab && npx playwright test tests/network-mock.spec.ts --reporter=line
```{{exec}}

The real `jsonplaceholder` user with `id: 1` is **not** named "Mock McMockface" — if this test passes, it's not by accident. `page.route()` intercepted the browser's real outgoing `fetch()` before it ever reached the network and answered it with the body we wrote, and the page rendered exactly what we sent it.
