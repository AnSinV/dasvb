#!/bin/bash

# Create network

sudo docker network create -d bridge --ip-range "172.28.5.0/24" --subnet "172.28.0.0/16" main_network

# Database service

cd "./Database"
sh "./initDatabase.sh"

echo Building database image...
sudo docker-compose -f docker-compose.yml build -q
echo Starting database services...
sudo docker-compose -f docker-compose.yml up -d

cd ..

# Accounts service

cd "./AccountService"
sh "./prepareService.sh"

echo Building AccountService images...
sudo docker-compose -f docker-compose.yml build -q
echo Starting AccountService images...
sudo docker-compose -f docker-compose.yml up -d

cd ..

# Nginx service

cd "./nginx"
sh "./prepareNginx.sh"

echo Building nginx image...
sudo docker-compose -f docker-compose.yml build -q
echo Starting nginx services...
sudo docker-compose -f docker-compose.yml up -d

cd ..
