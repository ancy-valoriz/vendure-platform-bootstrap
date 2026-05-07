#!/bin/bash

set -e

BACKEND_REPO="my-vendure-backend"
STOREFRONT_REPO="my-vendure-storefront"

echo "Creating backend repo..."

curl -X POST https://api.github.com/user/repos \
-H "Authorization: token $GITHUB_TOKEN" \
-H "Accept: application/vnd.github+json" \
-d "{\"name\":\"$BACKEND_REPO\",\"private\":false}"

echo "Creating storefront repo..."

curl -X POST https://api.github.com/user/repos \
-H "Authorization: token $GITHUB_TOKEN" \
-H "Accept: application/vnd.github+json" \
-d "{\"name\":\"$STOREFRONT_REPO\",\"private\":false}"