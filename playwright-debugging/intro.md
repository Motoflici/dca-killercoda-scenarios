### Playwright Fundamentals — Module 3

This lab supports **Module 3: Debugging Failing Tests** of *Playwright Fundamentals — Test Automation from Zero*.

Every test suite eventually goes red. This lab manufactures a real failure on purpose, then walks you through the actual diagnostic tools Playwright ships:

1. **UI mode** (`npx playwright test --ui`) — normally a local GUI app. Killercoda's `ubuntu` backend has no display, so we'll use Playwright's own documented `--ui-host=0.0.0.0 --ui-port=<port>` flags to serve it over plain HTTP instead, and open it through Killercoda's exposed-port mechanism.
2. **Trace viewer** — a full timeline, DOM snapshots, network log, and console log for the failing run.
3. Fixing the bug using exactly what the trace/timeline showed you, then re-running to confirm green.

Nothing about the bug or the fix is scripted for you to just copy — you'll read the failure the way you would in a real project.

Click **Start** when you're ready.
