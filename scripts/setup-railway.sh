#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

export RAILWAY_TOKEN=$RAILWAY_TOKEN

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

ENVIRONMENT="production"

cd generated/vendure-app

echo "Creating PostgreSQL service..."

railway add \
  --database postgres \
  --service vendure-postgres \
  --project $PROJECT_ID || true

echo "Waiting for PostgreSQL provisioning..."

sleep 30

echo "Fetching PostgreSQL variables..."

DB_HOST=$(railway variables --service vendure-postgres --project $PROJECT_ID | grep PGHOST | cut -d '=' -f2)

DB_PORT=$(railway variables --service vendure-postgres --project $PROJECT_ID | grep PGPORT | cut -d '=' -f2)

DB_NAME=$(railway variables --service vendure-postgres --project $PROJECT_ID | grep PGDATABASE | cut -d '=' -f2)

DB_USERNAME=$(railway variables --service vendure-postgres --project $PROJECT_ID | grep PGUSER | cut -d '=' -f2)

DB_PASSWORD=$(railway variables --service vendure-postgres --project $PROJECT_ID | grep PGPASSWORD | cut -d '=' -f2)

echo "Injecting backend database variables..."

railway variables set \
  DB_HOST=$DB_HOST \
  DB_PORT=$DB_PORT \
  DB_NAME=$DB_NAME \
  DB_USERNAME=$DB_USERNAME \
  DB_PASSWORD=$DB_PASSWORD \
  --service vendure-backend \
  --project $PROJECT_ID

echo "Deploying backend..."

cp Dockerfile.server Dockerfile

railway up \
  --service vendure-backend \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Waiting for backend deployment..."

sleep 120

BACKEND_URL=$(railway domain \
  --service vendure-backend \
  --project $PROJECT_ID)

echo "Backend URL: https://${BACKEND_URL}"

echo "Injecting storefront variables..."

railway variables set \
  NEXT_PUBLIC_VENDURE_SHOP_API_URL="https://${BACKEND_URL}/shop-api" \
  --service vendure-storefront \
  --project $PROJECT_ID

echo "Deploying storefront..."

cp Dockerfile.storefront Dockerfile

railway up \
  --service vendure-storefront \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Railway deployment completed"