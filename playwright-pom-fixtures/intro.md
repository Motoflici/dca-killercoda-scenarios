### Playwright Fundamentals — Module 4

This lab supports **Module 4: Scaling Your Test Suite — Page Object Model & Fixtures** of *Playwright Fundamentals — Test Automation from Zero*.

Two tests copy-pasting the same locators is fine. Twenty tests doing it is a maintenance problem: change one class name on the page and you're editing twenty files. This lab takes a small, flat test file and refactors it in two stages:

1. Extract a `TodoPage` **Page Object** class that owns the locators and the actions (`goto`, `addToDo`, `remove`, `removeAll`).
2. Wire that class into a **custom fixture** with `test.extend`, so every test just asks for `{ todoPage }` and gets a page that's already navigated and seeded with two items — setup and teardown live in one place instead of a `beforeEach`/`afterEach` pair.

At the end you'll run both the original flat file and the refactored one side by side and confirm they do exactly the same thing.

Click **Start** when you're ready.
