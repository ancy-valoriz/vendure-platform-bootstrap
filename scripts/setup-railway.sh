#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

export RAILWAY_TOKEN=$RAILWAY_TOKEN

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

ENVIRONMENT="production"

echo "Deploying backend..."
echo "Token length: ${#RAILWAY_TOKEN}"

cd generated/backend

railway up \
  --service vendure-backend \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach

echo "Deploying storefront..."

cd ../storefront

railway up \
  --service vendure-storefront \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT \
  --detach