With Node in place, scaffold a plain npm project and add Playwright's test package. We're doing this by hand (rather than `npm init playwright@latest`) so you see every moving part.

Create the project folder and initialize npm:

```
mkdir -p ~/pw-lab && cd ~/pw-lab && npm init -y
```{{exec}}

Install `@playwright/test` as a dev dependency:

```
cd ~/pw-lab && npm install -D @playwright/test
```{{exec}}

Now install the Chromium browser binary **and** the OS-level libraries Chromium needs (fonts, graphics and codec libraries) to actually launch on this bare VM, in one command:

```
cd ~/pw-lab && npx playwright install --with-deps chromium
```{{exec}}

> **Why one flag is enough:** `--with-deps` runs Playwright's own `install-deps` step first. Instead of you hunting down a stale `apt-get install libnss3 libatk...` list from a blog post, Playwright maps this machine's `/etc/os-release` to an internal table of packages it maintains for every release, then calls `apt-get install` for you. That's the current, correct way to get a headless-capable Chromium running on fresh Ubuntu — no separate library list to babysit or go stale.

Confirm the browser actually landed on disk:

```
ls ~/.cache/ms-playwright/
```{{exec}}

You should see a `chromium-<build>` folder (and a `chromium_headless_shell-<build>` folder next to it).

Finally, add a minimal config so the test runner knows where your tests live and always writes an HTML report:

```
cat > ~/pw-lab/playwright.config.ts << 'CONFIG_EOF'
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  reporter: 'html',
  use: {
    trace: 'on-first-retry',
  },
});
CONFIG_EOF
```{{exec}}

```
mkdir -p ~/pw-lab/tests
```{{exec}}
