#!/bin/bash

set -e

mkdir -p generated

rm -rf generated/vendure-app

cp -R templates/vendure-app generated/vendure-app

echo "Vendure monorepo copied"