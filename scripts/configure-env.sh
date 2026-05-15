#!/bin/bash

set -e

mkdir -p generated/vendure-app

# -----------------------------
# App Secrets
# -----------------------------

export COOKIE_SECRET=$(openssl rand -hex 32)

export SUPERADMIN_USERNAME=superadmin

export SUPERADMIN_PASSWORD=superadmin

# -----------------------------
# Environment
# -----------------------------

export APP_ENV=production
export NODE_ENV=production

# -----------------------------
# Storefront API URL
# Temporary placeholder
# Will be updated after backend deploy
# -----------------------------

export NEXT_PUBLIC_VENDURE_SHOP_API_URL=${NEXT_PUBLIC_VENDURE_SHOP_API_URL:-http://localhost:3000/shop-api}

export NEXT_PUBLIC_VENDURE_TOKEN=testtoken

# -----------------------------
# Generate .env
# -----------------------------

envsubst < templates/backend.env.template > generated/vendure-app/.env

echo "Environment file generated successfully"