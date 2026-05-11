#!/bin/bash

set -e

APP_REPO_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/my-vendure-app.git"

git config --global user.email "github-actions@github.com"

git config --global user.name "github-actions"

echo "Pushing Vendure monorepo..."

cd generated/vendure-app

git init

git branch -M main

git add .

git commit -m "Initial Vendure app" || true

git remote remove origin || true

git remote add origin $APP_REPO_URL

git push -u origin main --force

echo "Push completed"