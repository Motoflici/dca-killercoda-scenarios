The workflow's final step uploads `playwright-report/` as a build artifact. Confirm it's exactly what you'd expect — a self-contained static HTML report:

```
ls -la ~/pw-lab/playwright-report/
```{{exec}}

```
du -sh ~/pw-lab/playwright-report/
```{{exec}}

That directory is precisely what `actions/upload-artifact@v4` would zip up and attach to the workflow run on GitHub, downloadable from the run's **Summary** page for 30 days (per `retention-days: 30` in the YAML). You can preview it locally the same way you have all course:

```
cd ~/pw-lab && npx playwright show-report --host=0.0.0.0 --port=9323 &
```{{exec}}

[OPEN HTML REPORT]({{TRAFFIC_HOST1_9323}})

That's the entire pipeline, proven end to end on this VM. See the **finish** page for exactly what's left to do to make this run for real on GitHub.
