#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

export RAILWAY_TOKEN=$RAILWAY_TOKEN

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

ENVIRONMENT="production"

cd generated/vendure-app

echo "Deploying backend..."

cp Dockerfile.server Dockerfile

railway up \
  --service vendure-backend \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Waiting for backend deployment..."

sleep 120

BACKEND_URL="https://vendure-backend.up.railway.app"

echo "Deploying storefront..."

cp Dockerfile.storefront Dockerfile

export NEXT_PUBLIC_VENDURE_SHOP_API_URL="${BACKEND_URL}/shop-api"

railway up \
  --service vendure-storefront \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Railway deployment completed"