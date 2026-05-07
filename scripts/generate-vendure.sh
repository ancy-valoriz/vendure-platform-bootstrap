#!/bin/bash

set -e

mkdir -p generated

cd generated

echo "Generating Vendure backend..."

printf "1\nn\n" | npx @vendure/create@3.6.3 backend