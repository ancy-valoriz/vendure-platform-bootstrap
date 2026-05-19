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

echo "Creating and attaching volume..."

railway volume add \
  --mount-path /vendure-assets \
  --json || true

echo "Volume configured successfully"