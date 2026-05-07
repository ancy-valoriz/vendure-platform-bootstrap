#!/bin/bash

set -e

BACKEND_REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/my-vendure-backend.git"

STOREFRONT_REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/my-vendure-storefront.git"

git config --global user.email "github-actions@github.com"

git config --global user.name "github-actions"

echo "Pushing backend..."

cd generated/backend

git init

git branch -M main

git add .

git commit -m "Initial backend"

git remote add origin $BACKEND_REPO_URL

git push -u origin main --force

cd ../../generated/storefront

echo "Pushing storefront..."

git init

git branch -M main

git add .

git commit -m "Initial storefront"

git remote add origin $STOREFRONT_REPO_URL

git push -u origin main --force