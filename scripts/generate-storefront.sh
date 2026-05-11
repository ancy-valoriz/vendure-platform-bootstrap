#!/bin/bash

set -e

cd generated

echo "Cloning storefront..."

rm -rf storefront

git -c credential.helper= clone https://github.com/vendure-ecommerce/storefront storefront

cd storefront

npm install next@^15.4.10

cat > Dockerfile <<EOF
FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
EOF