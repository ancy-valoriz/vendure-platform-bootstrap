#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

export RAILWAY_TOKEN=$RAILWAY_TOKEN

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

ENVIRONMENT="production"

cd generated/vendure-app

echo "Deploying backend..."

echo "Current directory:"
pwd

echo "Files:"
ls -la

echo "========== Vendure Config =========="
grep -n "DATABASE_URL" apps/server/src/vendure-config.ts || true
grep -n "DB_HOST" apps/server/src/vendure-config.ts || true
echo "===================================="

cp Dockerfile.server Dockerfile

railway up \
  --service vendure-backend \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Waiting for backend deployment..."

sleep 120

echo "Deploying storefront..."

cp Dockerfile.storefront Dockerfile

railway up \
  --service vendure-storefront \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Railway deployment completed"