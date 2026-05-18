#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

PROJECT_ID="$RAILWAY_PROJECT_ID"

ENVIRONMENT="production"

railway variables set \
  DATABASE_URL='${{Postgres.DATABASE_URL}}' \
  COOKIE_SECRET="$COOKIE_SECRET" \
  SUPERADMIN_USERNAME="$SUPERADMIN_USERNAME" \
  SUPERADMIN_PASSWORD="$SUPERADMIN_PASSWORD" \
  --service vendure-backend \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT