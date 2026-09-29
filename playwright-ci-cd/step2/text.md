Look at the workflow file Killercoda shipped onto this VM as a scenario asset:

```
cat ~/pw-lab/.github/workflows/playwright.yml
```{{exec}}

This is the current workflow from [playwright.dev's own CI setup guide](https://playwright.dev/docs/ci-intro), not a hand-rolled approximation. Walking through it top to bottom:

- **`on:`** — triggers on every `push` and `pull_request` targeting `main` or `master`.
- **`runs-on: ubuntu-latest`** — GitHub's hosted Ubuntu runner. Not a coincidence: it's the same family of OS you've been running commands on this whole course.
- **`actions/checkout@v6`** — clones your repository onto the runner. This is the GitHub-hosted equivalent of the scenario asset that put `playwright.yml` on your VM just now.
- **`actions/setup-node@v6`** with `node-version: lts/*` — installs the current Node.js LTS, exactly like the NodeSource install you've done by hand six times now, except GitHub does it for you.
- **`npm ci`** — installs dependencies from `package-lock.json` exactly as pinned (unlike `npm install`, it refuses to touch the lockfile), which is why the lab kept `package-lock.json` around.
- **`npx playwright install --with-deps`** — the same command from Module 1, minus the `chromium` argument, so it installs Chromium, Firefox and WebKit together with the OS libraries all three need.
- **`npx playwright test`** — runs the whole suite, exactly as you've run it locally every module.
- **`actions/upload-artifact@v4`** — uploads the `playwright-report/` directory as a downloadable build artifact, kept for 30 days. Its `if:` condition runs this step whenever the job wasn't cancelled outright — so a failing test run still gets its report uploaded, which is usually the report you actually want to look at.

Nothing here is exotic. It's the same five commands you've typed by hand across this course, in the same order, on the same base OS.
