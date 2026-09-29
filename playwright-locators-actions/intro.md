### Playwright Fundamentals — Module 2

This lab supports **Module 2: User-Facing Locators & Actions** of *Playwright Fundamentals — Test Automation from Zero*.

This VM is fresh and empty, just like the last one — each Killercoda scenario is its own throwaway machine, so we'll re-run the setup from Module 1 first. Then, with no recorder involved, you'll write a Playwright test entirely by hand against a real, live page (`demo.playwright.dev/todomvc`), building up one file step by step:

1. `getByRole`, `getByLabel`, `getByText` — the locators that describe what a user actually sees.
2. Chaining locators and `.filter({ hasText })` to pick one element out of several identical ones.
3. Core actions: `click`, `fill`, `hover`, and the checkbox-specific behavior of `check`/toggle.
4. Web-first assertions like `toHaveCount`, `toBeChecked`, and `.not.toBeVisible()`.

Every locator you'll type here is lifted from Playwright's own currently-maintained example test suite for this exact page — nothing invented, nothing guessed.

Click **Start** when you're ready.
