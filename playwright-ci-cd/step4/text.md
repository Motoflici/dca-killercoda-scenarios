Now replay the workflow's own steps, by hand, in the same order, on this VM. If any of these fail here, they'd fail in CI too — that's the whole point of proving the recipe locally before it ever touches GitHub.

**Step: "Install dependencies"** — `npm ci` installs exactly what `package-lock.json` pins, and (unlike `npm install`) refuses to modify the lockfile if it's out of sync with `package.json`:

```
cd ~/pw-lab && npm ci
```{{exec}}

**Step: "Install Playwright Browsers"** — the workflow calls `install --with-deps` with no browser name, so it installs all three engines plus every OS library they need:

```
cd ~/pw-lab && npx playwright install --with-deps
```{{exec}}

```
ls ~/.cache/ms-playwright/
```{{exec}}

You should now see `chromium-*`, `firefox-*`, and `webkit-*` folders (Chromium was already there from Step 1; this call added the other two and re-confirmed Chromium's deps).

**Step: "Run Playwright tests"**:

```
cd ~/pw-lab && npx playwright test
```{{exec}}

That's the entire CI job, run start to finish on this VM with the exact commands from the YAML file — no simulation, no `act`, no Docker-in-Docker. If it's green here, the "Run Playwright tests" step in a real Actions run would be green too.
