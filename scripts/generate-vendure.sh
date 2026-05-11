#!/bin/bash

set -e

mkdir -p generated

cd generated

rm -rf backend

echo "Creating Vendure backend..."

npx @vendure/create@latest backend \
  --db postgres \
  --no-git \
  --package-manager npm

cd backend

cat > Dockerfile <<EOF
FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV NODE_ENV=production
ENV PORT=3000

RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start:server"]
EOF

echo "Backend created successfully"