#!/bin/bash

set -e

mkdir -p generated/vendure-app

export COOKIE_SECRET=$(openssl rand -hex 32)

export SUPERADMIN_USERNAME=superadmin

export SUPERADMIN_PASSWORD=superadmin

# Railway PostgreSQL variables
export DB_HOST=${DB_HOST}
export DB_PORT=${DB_PORT:-5432}
export DB_NAME=${DB_NAME}
export DB_USERNAME=${DB_USERNAME}
export DB_PASSWORD=${DB_PASSWORD}

# Backend URL
export BACKEND_URL=${BACKEND_URL}

# Storefront variables
export NEXT_PUBLIC_VENDURE_API_URL=${BACKEND_URL}/shop-api

export NEXT_PUBLIC_SHOP_API_URL=${BACKEND_URL}/shop-api

export NEXT_PUBLIC_VENDURE_TOKEN=testtoken

envsubst < templates/backend.env.template > generated/vendure-app/.env

echo "Environment file generated"