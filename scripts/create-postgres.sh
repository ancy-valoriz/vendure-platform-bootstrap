#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

echo "Linking Railway project..."

railway link --project $RAILWAY_PROJECT_ID

echo "Creating PostgreSQL service..."

railway deploy --template postgres

echo "Waiting for PostgreSQL provisioning..."

sleep 60

echo "PostgreSQL created successfully"