#!/bin/sh
echo Building nginx from Dockerfile.dev nginx:v0

docker build -t nginx:v0 -f Dockerfile.dev .

echo Creating Conatiner Out of Image
docker container create --name extract nginx:v0
docker container cp extract:/usr/local/nginx/ ./nginx-extract
docker container rm -f extract

echo Building optimized nginx version nginx:v3

docker build --no-cache -t nginx:v3 .
rm -r ./nginx-extract