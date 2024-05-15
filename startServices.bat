@echo off

rem Create network

docker network create -d bridge --ip-range "172.28.5.0/24" --subnet "172.28.0.0/16" main_network

rem Database service

cd "./Database"
call "./initDatabase.bat"

echo Building database  image...
docker-compose -f docker-compose.yml build
echo Starting database  service...
docker-compose -f docker-compose.yml up -d

cd ..

rem Accounts service

cd "./AccountService"
rem call "./prepareService.bat"

echo Building AccountService images...
docker-compose -f docker-compose.yml build

echo Starting AccountService images...
docker-compose -f docker-compose.yml up -d

cd ..

rem Nginx service

cd "./nginx"
call "./prepareNginx.bat"

echo Building nginx image...
docker-compose -f docker-compose.yml build
echo Starting nginx service...
docker-compose -f docker-compose.yml up -d

cd ..