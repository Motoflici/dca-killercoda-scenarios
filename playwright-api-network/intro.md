### Playwright Fundamentals — Module 5

This lab supports **Module 5: Beyond the UI — API Requests & Network Mocking** of *Playwright Fundamentals — Test Automation from Zero*.

Playwright isn't only a browser driver. Its `request` fixture sends real HTTP requests with no browser involved at all, and its `page.route()` API lets a UI test intercept and rewrite any network response the page makes. In this lab you'll use both, for real:

1. `GET` a real public REST API (`jsonplaceholder.typicode.com`) with the `request` fixture and assert on the JSON response.
2. `POST` to that same API and assert on what comes back.
3. Serve a tiny local page that fetches from that same API client-side, then use `page.route()` to intercept that exact call and fulfill it with fake data — and prove the fake data is what actually rendered.

Click **Start** when you're ready.
