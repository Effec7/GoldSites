#!/usr/bin/env bash
set -euo pipefail

REPO_FULL_NAME="${1:-}"

if [[ -z "$REPO_FULL_NAME" ]]; then
  echo "Usage: ./scripts/push_to_github.sh YOUR_GITHUB_USERNAME/goldsites-app"
  exit 1
fi

if [[ -d .git ]]; then
  echo "This folder already has a .git directory. Aborting to avoid changing an existing repo."
  exit 1
fi

git init
git branch -M main
git add .
git commit -m "Initial GoldSites FlutterFlow export"

if command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI found. Creating private repo and pushing..."
  gh repo create "$REPO_FULL_NAME" --private --source=. --remote=origin --push
else
  echo "GitHub CLI not found. Create an empty private repo first, then run:"
  echo "git remote add origin https://github.com/$REPO_FULL_NAME.git"
  echo "git push -u origin main"
fi
