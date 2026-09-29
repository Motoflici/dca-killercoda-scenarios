#!/bin/bash
set -u

if ! command -v yamllint >/dev/null 2>&1; then
  echo "yamllint is not installed"
  exit 1
fi

[ -f "$HOME/pw-lab/.yamllint" ] || { echo "~/pw-lab/.yamllint config not found"; exit 1; }

if ! yamllint -c "$HOME/pw-lab/.yamllint" "$HOME/pw-lab/.github/workflows/playwright.yml"; then
  echo "yamllint reported problems with playwright.yml"
  exit 1
fi

echo "Workflow YAML is clean"
exit 0
