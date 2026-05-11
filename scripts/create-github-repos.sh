#!/bin/bash

set -e

APP_REPO="my-vendure-app"

echo "Creating Vendure app repo..."

curl -X POST https://api.github.com/user/repos \
-H "Authorization: token $GITHUB_TOKEN" \
-H "Accept: application/vnd.github+json" \
-d "{\"name\":\"$APP_REPO\",\"private\":false}" || true

echo "Repository ready"