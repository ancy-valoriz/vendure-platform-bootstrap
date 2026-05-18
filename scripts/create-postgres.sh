#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

PROJECT_ID="$RAILWAY_PROJECT_ID"

echo "Creating PostgreSQL service..."

railway deploy --template postgres \
  --project $PROJECT_ID

echo "Waiting for PostgreSQL provisioning..."

sleep 60

echo "PostgreSQL created successfully"