Run the test you just wrote against the real, live TodoMVC demo site:

```
cd ~/pw-lab && npx playwright test
```{{exec}}

Playwright launches the Chromium binary you installed in Step 2 — headless, which is the normal way tests run both here and in CI — drives it against `https://demo.playwright.dev/todomvc/`, and reports the result in your terminal.

Because `playwright.config.ts` sets `reporter: 'html'`, a full report was also written to `~/pw-lab/playwright-report/`. Serve it and bind it to all interfaces so Killercoda's proxy can reach it:

```
cd ~/pw-lab && npx playwright show-report --host=0.0.0.0 --port=9323 &
```{{exec}}

Then open it through the exposed port:

[OPEN HTML REPORT]({{TRAFFIC_HOST1_9323}})

> `show-report` binds to `localhost` by default, which is unreachable from your browser tab. `--host=0.0.0.0` makes it listen on every interface; `--port=9323` is its own default, made explicit here so the port number above matches.

Click into the one test in the report and look at the **Source** and **Attachments** tabs — you're looking at a real trace of a real browser hitting a real site.
