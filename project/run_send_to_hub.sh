#!/bin/bash

cd nginx

docker login

docker build -t vladchu/nginx-web:latest .
docker push vladchu/nginx-web:latest