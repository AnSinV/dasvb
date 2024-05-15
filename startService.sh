#!/bin/bash

# Create network

docker network create -d bridge --ip-range "172.28.5.0/24" --subnet "172.28.0.0/16" main_network

# Database service

cd "./Database"
sh "./initDatabase.sh"

echo Building database image...
docker-compose -f docker-compose.yml build
echo Starting database services...
docker-compose -f docker-compose.yml up -d

cd ..
# Accounts service

cd "./AccountService"
sh "./prepareService.sh"

echo Building AccountService images...
docker-compose -f docker-compose.yml build
echo Starting AccountService images...
docker-compose -f docker-compose.yml up -d

cd ..

# Nginx service

cd "./nginx"
sh "./prepareNginx.sh"

echo Building nginx image...
docker-compose -f docker-compose.yml build
echo Starting nginx services...
docker-compose -f docker-compose.yml up -d

cd ..
