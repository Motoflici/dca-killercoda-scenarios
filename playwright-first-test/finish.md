### What you just proved

- A bare Ubuntu VM, with no prior tooling, can go from zero to a passing browser test in four short steps.
- `npx playwright install --with-deps chromium` is the single command that gets you a real, sandboxed Chromium build **and** every OS-level library it needs — no hand-maintained `apt` list required.
- Playwright's **codegen** locator strategy — `getByRole` first — is the same strategy you should reach for when writing tests by hand.
- `npx playwright test` really drove a real browser against `https://demo.playwright.dev/todomvc/` and the HTML report proves it.

### Next up

**Module 2: User-Facing Locators & Actions** goes deeper on `getByRole`, `getByLabel`, `getByText`, chaining, filtering, and web-first assertions — continue with the `playwright-locators-actions` scenario.
