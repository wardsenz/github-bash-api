#!/usr/bin/env bash

set -e

# test script should be ran from the project's WD
source "issues.sh"

utils::validate_jq

# params are passed from the GitHub action
TOKEN="$1"
OWNER="$2"
GITHUB_REPO="$3"

echo "---= Running issue count test =---"
count=$(count_issues "$TOKEN" "$OWNER" "$GITHUB_REPO")
echo "[INFO] got issues count of $count"
[[ "$count" -eq 1 ]] || { echo "[X] issues count test failed"; exit 1; }