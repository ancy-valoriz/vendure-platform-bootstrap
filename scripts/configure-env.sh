#!/bin/bash

set -e

if [ ! -d "generated/vendure-app" ]; then
  echo "Vendure app not generated"
  exit 1
fi

if [ -z "$NEXT_PUBLIC_VENDURE_SHOP_API_URL" ]; then
  echo "NEXT_PUBLIC_VENDURE_SHOP_API_URL is not set"
  exit 1
fi

# Generate .env from template using GitHub Actions env variables
envsubst < templates/backend.env.template > generated/vendure-app/.env

echo "Environment file generated successfully"