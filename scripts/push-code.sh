#!/bin/bash

set -e

BACKEND_REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/my-vendure-backend.git"

STOREFRONT_REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/my-vendure-storefront.git"

echo "Pushing backend..."

cd generated/backend

git init

git branch -M main

git add .

git commit -m "Initial backend"

git remote add origin $BACKEND_REPO_URL

git push -u origin main --force

cd ../../

echo "Pushing storefront..."

cd generated/storefront

git init

git branch -M main

git add .

git commit -m "Initial storefront"

git remote add origin $STOREFRONT_REPO_URL

git push -u origin main --force