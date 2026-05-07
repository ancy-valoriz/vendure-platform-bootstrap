#!/bin/bash

set -e

export COOKIE_SECRET=$(openssl rand -hex 32)

export SUPERADMIN_USERNAME=admin

export SUPERADMIN_PASSWORD=$(openssl rand -base64 16)

export DB_HOST=postgres.railway.internal
export DB_PORT=5432
export DB_NAME=railway
export DB_USERNAME=postgres
export DB_PASSWORD=password

export NEXT_PUBLIC_VENDURE_API_URL=https://backend.up.railway.app/shop-api

export NEXT_PUBLIC_SHOP_API_URL=https://backend.up.railway.app/shop-api

export NEXT_PUBLIC_VENDURE_TOKEN=testtoken

envsubst < templates/backend.env.template > generated/backend/.env

envsubst < templates/storefront.env.template > generated/storefront/.env