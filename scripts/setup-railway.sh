#!/bin/bash

set -e

export RAILWAY_TOKEN="${RAILWAY_TOKEN}"

echo "Checking Railway auth..."

if [ -z "$RAILWAY_TOKEN" ]; then
  echo "RAILWAY_TOKEN is empty"
  exit 1
fi

echo "Token exists"

railway whoami

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

echo "Deploying backend..."

cd generated/backend

railway link --project $PROJECT_ID --service vendure-backend

railway up

echo "Deploying storefront..."

cd ../storefront

railway link --project $PROJECT_ID --service vendure-storefront

railway up