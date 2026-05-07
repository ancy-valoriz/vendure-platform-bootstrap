#!/bin/bash

set -e

cd generated

echo "Cloning storefront..."

rm -rf storefront

git -c credential.helper= clone https://github.com/vendure-ecommerce/storefront storefront