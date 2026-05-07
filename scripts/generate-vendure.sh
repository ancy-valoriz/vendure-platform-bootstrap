#!/bin/bash

set -e

mkdir -p generated

cd generated

echo "Generating Vendure backend..."

npx @vendure/create@latest backend --quickstart --package-manager npm