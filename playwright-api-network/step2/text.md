`jsonplaceholder.typicode.com` is a free, public, zero-auth fake REST API meant exactly for this kind of exercise. Write a test that hits it with Playwright's built-in **`request`** fixture — no `page`, no browser, just HTTP:

```
cat > ~/pw-lab/tests/api.spec.ts << 'SPEC_EOF'
import { test, expect } from '@playwright/test';

test('GET a single post from a real public API', async ({ request }) => {
  const response = await request.get('https://jsonplaceholder.typicode.com/posts/1');

  expect(response.ok()).toBeTruthy();
  expect(response.status()).toBe(200);

  const body = await response.json();
  expect(body).toHaveProperty('id', 1);
  expect(body).toHaveProperty('title');
  expect(typeof body.title).toBe('string');
});
SPEC_EOF
```{{exec}}

Run it:

```
cd ~/pw-lab && npx playwright test tests/api.spec.ts --reporter=line
```{{exec}}

`request` is one of Playwright's built-in fixtures, alongside `page`, `context`, and `browser`. It's backed by an `APIRequestContext`, and it's exactly what you'd reach for to seed server-side state before a UI test, or to verify a UI action actually persisted somewhere.
