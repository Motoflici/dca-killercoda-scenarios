### What you just proved

- The `request` fixture sends real HTTP requests — no browser, no page, just `await request.get(...)`/`await request.post(...)` and a real JSON response back from a real server.
- `response.ok()`, `response.status()`, and `await response.json()` are enough to build a genuine API test.
- `page.route(url, handler)` intercepts a specific outgoing request from inside a browser context; `route.fulfill({ status, contentType, body })` answers it without ever touching the real network.
- You proved the mock actually worked by asserting the **fake** name rendered in the DOM, not the real one — the strongest kind of mocking assertion there is.

### Next up

**Module 6: CI/CD** takes everything from the last five modules and wires it into a GitHub Actions workflow — continue with the `playwright-ci-cd` scenario.
