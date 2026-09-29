Standard setup, one more time:

```
sudo apt-get update
```{{exec}}

```
sudo apt-get install -y ca-certificates curl gnupg
```{{exec}}

```
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
```{{exec}}

```
sudo apt-get install -y nodejs
```{{exec}}

```
mkdir -p ~/pw-lab && cd ~/pw-lab && npm init -y && npm install -D @playwright/test
```{{exec}}

```
cd ~/pw-lab && npx playwright install --with-deps chromium
```{{exec}}

```
mkdir -p ~/pw-lab/tests
```{{exec}}

This time we deliberately set `trace: 'on'` instead of the usual `'on-first-retry'`, so a full trace is captured on every run — including the very first failing one, with no retry needed:

```
cat > ~/pw-lab/playwright.config.ts << 'CONFIG_EOF'
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  reporter: 'html',
  use: {
    trace: 'on',
  },
});
CONFIG_EOF
```{{exec}}
