#!/bin/bash

set -e

echo "Logging into Railway..."

railway login --token $RAILWAY_TOKEN

echo "Creating Railway project..."

railway init

echo "Deploying backend..."

cd generated/backend

railway up

cd ../storefront

echo "Deploying storefront..."

railway up