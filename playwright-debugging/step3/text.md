Playwright's **UI mode** is normally a local desktop app: `npx playwright test --ui`. It needs a display to draw into, which this terminal-only VM doesn't have. Playwright documents exactly this scenario (remote containers, Codespaces, cloud shells) and ships a fix: serve UI mode over HTTP instead.

```
cd ~/pw-lab && npx playwright test --ui-host=0.0.0.0 --ui-port=8080 &
```{{exec}}

Give it a couple of seconds to boot, then open it through Killercoda's exposed port:

[OPEN UI MODE]({{TRAFFIC_HOST1_8080}})

> `--ui-host=0.0.0.0` tells it to accept connections from outside the VM (not just `localhost`); `--ui-port=8080` pins it to a fixed port so the link above always matches.

In UI mode:

1. Click the failing test in the left sidebar.
2. Open the **Actions** list and click through each step — notice the DOM snapshot on the right updates for every action.
3. Click the final failing assertion. The timeline and the **Before**/**After** DOM snapshots show you exactly what was on the page at the moment of failure.
4. Count the `<li>` rows in the snapshot yourself.

<details><summary>Prefer the standalone trace viewer over UI mode?</summary>

Every run with `trace: 'on'` writes a `trace.zip` per test under `test-results/`. You can open any of them the same way, over HTTP:

```
cd ~/pw-lab && TRACE=$(find test-results -name trace.zip | head -n1) && npx playwright show-trace --host=0.0.0.0 --port=9224 "$TRACE" &
```{{exec}}

[OPEN TRACE VIEWER]({{TRAFFIC_HOST1_9224}})

Both tools are reading the same trace data — UI mode just wraps it with the ability to re-run tests too.

</details>

What does the DOM snapshot actually show? Three `<li>` items — the test added three todos, correctly, and it's the *assertion* that's wrong, not the app or the locator.
