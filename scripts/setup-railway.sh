#!/bin/bash

set -e

export RAILWAY_TOKEN=$RAILWAY_TOKEN

echo "Deploying backend..."

cd generated/backend

railway up --service backend

echo "Deploying storefront..."

cd ../storefront

railway up --service storefront