#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

echo "Checking Railway token..."

if [ -z "$RAILWAY_API_TOKEN" ]; then
  echo "RAILWAY_API_TOKEN is EMPTY"
  exit 1
fi

echo "RAILWAY_API_TOKEN detected"

echo "Linking Railway project..."

railway link --project "$RAILWAY_PROJECT_ID"

echo "Creating PostgreSQL service..."

railway deploy --template postgres

echo "Waiting for PostgreSQL provisioning..."

sleep 60

echo "PostgreSQL created successfully"