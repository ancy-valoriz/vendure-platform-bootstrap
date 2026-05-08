#!/bin/bash

set -e

export RAILWAY_TOKEN=$RAILWAY_TOKEN

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

echo "Deploying backend..."

cd generated/backend

railway link --project $PROJECT_ID --service vendure-backend

railway up --detach

echo "Deploying storefront..."

cd ../storefront

railway link --project $PROJECT_ID --service vendure-storefront

railway up --detach