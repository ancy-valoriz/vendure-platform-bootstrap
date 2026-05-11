#!/bin/bash

set -e

mkdir -p generated

cd generated

echo "Cloning Vendure backend starter..."

rm -rf backend

git -c credential.helper= clone https://github.com/vendure-ecommerce/real-world-vendure backend

cd backend

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

echo "Backend Dockerfile created"