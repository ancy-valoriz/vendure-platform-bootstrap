#!/bin/bash

set -e

cd generated

echo "Cloning storefront..."

git clone https://github.com/vendure-ecommerce/storefront-nextjs-starter storefront