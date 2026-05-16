#!/bin/bash

set -e

export PATH="$HOME/.railway/bin:$PATH"

PROJECT_ID="637e48f7-b697-4fa3-84ec-fc3d89e5ddda"

ENVIRONMENT="production"

echo "Fetching Railway variables..."

railway variables \
  --project $PROJECT_ID \
  --environment $ENVIRONMENT