#!/bin/bash

set -e

if [ ! -d "generated/vendure-app" ]; then
  echo "Vendure app not generated"
  exit 1
fi

# Temporary fallback until backend URL is generated after deployment
export NEXT_PUBLIC_VENDURE_SHOP_API_URL=${NEXT_PUBLIC_VENDURE_SHOP_API_URL:-http://localhost:3000/shop-api}

# Generate .env from template using GitHub Actions env variables
envsubst < templates/backend.env.template > generated/vendure-app/.env

echo "Environment file generated successfully"