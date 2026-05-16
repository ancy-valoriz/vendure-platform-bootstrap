#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

ENVIRONMENT="production"

railway variables set \
  DATABASE_URL="postgresql://postgres:GTYjJpWkQbAfciQDbOSOUhZLvlimszhP@postgres.railway.internal:5432/railway" \
  COOKIE_SECRET="XJHe8VoSLDQ6rxGvkBvmcg" \
  SUPERADMIN_USERNAME="admin@vendure.io" \
  SUPERADMIN_PASSWORD="superadmin" \
  --service vendure-backend \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT