#!/bin/bash

set -e

mkdir -p generated

cd generated

echo "Generating Vendure backend..."

npx @vendure/create@3.6.3 backend --disable-telemetry <<EOF
1
n
EOF