### Playwright Fundamentals — Module 6

This lab supports **Module 6: Continuous Integration** of *Playwright Fundamentals — Test Automation from Zero*, the final module in this course.

Killercoda's VM can't actually run a GitHub Actions workflow — there's no GitHub repo here, and no Actions runner. What it *can* do, and what this lab does for real, is everything short of that:

1. Inspect a real, current, `playwright.dev`-documented GitHub Actions workflow for running Playwright tests (it's already sitting on your VM — Killercoda shipped it to you as a scenario asset, the same way it would land on a real Actions runner via `actions/checkout`).
2. **Lint** the YAML with `yamllint` to prove it's syntactically valid.
3. **Replay every step of the workflow by hand**, in order, on this VM — `npm ci`, `npx playwright install --with-deps`, `npx playwright test` — so you know the recipe actually works before you ever push it.
4. Confirm the exact artifact (`playwright-report/`) that the workflow's last step would upload.

By the end you'll know exactly what each line of the workflow does, why it's ordered that way, and what "real" step is left (pushing to an actual GitHub repo) once you leave this VM.

Click **Start** when you're ready.
