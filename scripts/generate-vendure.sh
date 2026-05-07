#!/bin/bash

set -e

mkdir -p generated

cd generated

echo "Cloning Vendure backend starter..."

rm -rf backend

git -c credential.helper= clone https://github.com/vendure-ecommerce/real-world-vendure backend