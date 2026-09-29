Now `POST` to the same API and assert on what comes back. `jsonplaceholder` fakes resource creation: it returns a real `201`, echoes the body you sent, and adds an `id`.

```
cat >> ~/pw-lab/tests/api.spec.ts << 'SPEC_EOF'

test('POST creates a resource on the real API', async ({ request }) => {
  const response = await request.post('https://jsonplaceholder.typicode.com/posts', {
    data: {
      title: 'Playwright Fundamentals',
      body: 'Learning API testing',
      userId: 1,
    },
  });

  expect(response.status()).toBe(201);

  const created = await response.json();
  expect(created.title).toBe('Playwright Fundamentals');
  expect(created).toHaveProperty('id');
});
SPEC_EOF
```{{exec}}

Run the whole API file:

```
cd ~/pw-lab && npx playwright test tests/api.spec.ts --reporter=line
```{{exec}}

`data` on `request.post()` is serialized to JSON automatically (and the right `Content-Type` header set for you) — you don't call `JSON.stringify` yourself unless you need to send something Playwright can't infer.
