#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

PROJECT_ID=$RAILWAY_PROJECT_ID
ENVIRONMENT=$APP_ENV

echo "Linking backend service..."

railway link \
  --project "$PROJECT_ID" \
  --environment "$ENVIRONMENT" \
  --service vendure-backend

echo "Creating volume..."

railway volume create vendure-assets || true

echo "Mounting volume..."

railway volume mount \
  vendure-assets \
  --service vendure-backend \
  --path /vendure-assets

echo "Volume configured successfully"