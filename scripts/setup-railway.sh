#!/bin/bash

set -e

echo "Checking Railway auth..."

echo $RAILWAY_TOKEN | railway login --token

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

echo "Deploying backend..."

cd generated/backend

railway link --project $PROJECT_ID --service vendure-backend

railway up

echo "Deploying storefront..."

cd ../storefront

railway link --project $PROJECT_ID --service vendure-storefront

railway up