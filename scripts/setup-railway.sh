#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

PROJECT_ID=$RAILWAY_PROJECT_ID
ENVIRONMENT=$APP_ENV

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

sleep 180

echo "Fetching backend domain..."

railway link \
  --project "$PROJECT_ID" \
  --environment "$ENVIRONMENT" \
  --service vendure-backend

BACKEND_DOMAIN=$(railway domain | grep -o 'https://[^ ]*')

echo "Backend domain: $BACKEND_DOMAIN"

export NEXT_PUBLIC_VENDURE_SHOP_API_URL="$BACKEND_DOMAIN/shop-api"

echo "Shop API URL: $NEXT_PUBLIC_VENDURE_SHOP_API_URL"

echo "Injecting storefront variables into Railway..."

railway link \
  --project "$PROJECT_ID" \
  --environment "$ENVIRONMENT" \
  --service vendure-storefront

STOREFRONT_DOMAIN=$(railway domain | grep -o 'https://[^ ]*')

echo "Storefront domain: $STOREFRONT_DOMAIN"

railway variables set \
  NEXT_PUBLIC_VENDURE_SHOP_API_URL="$NEXT_PUBLIC_VENDURE_SHOP_API_URL" \
  VENDURE_SHOP_API_URL="$NEXT_PUBLIC_VENDURE_SHOP_API_URL" \
  NEXT_PUBLIC_SITE_URL="$STOREFRONT_DOMAIN"

echo "Regenerating .env with production API URL..."
echo "========== GENERATED ENV VALUES =========="
echo "NEXT_PUBLIC_VENDURE_SHOP_API_URL=$NEXT_PUBLIC_VENDURE_SHOP_API_URL"
echo "========================================="

envsubst < ../../templates/backend.env.template > .env

cp .env apps/storefront/.env

echo "========== GENERATED .ENV =========="
cat .env
echo "===================================="

echo "Deploying storefront..."

cp Dockerfile.storefront Dockerfile

railway up \
  --service vendure-storefront \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Railway deployment completed"