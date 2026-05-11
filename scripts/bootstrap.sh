#!/bin/bash

set -e

echo "Starting full automation..."

bash scripts/install-tools.sh

bash scripts/create-github-repos.sh

bash scripts/generate-vendure.sh

bash scripts/configure-env.sh

bash scripts/push-code.sh

cd terraform

terraform init

terraform apply -auto-approve

cd ..

bash scripts/setup-railway.sh

echo "Deployment complete"