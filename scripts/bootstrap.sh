#!/bin/bash

set -e

echo "Starting full automation..."

bash scripts/install-tools.sh

bash scripts/generate-vendure.sh

bash scripts/configure-env.sh

cd terraform

terraform init

terraform apply -auto-approve

cd ..

bash scripts/create-postgres.sh
bash scripts/create-volume.sh
bash scripts/configure-railway-db.sh

bash scripts/setup-railway.sh

echo "Deployment complete"