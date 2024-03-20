#!/bin/bash

echo "Pulling Image"
echo "=========================="
docker pull rabbitmq:latest
echo

containers=$(docker ps -a --format "{{.Names}}")
echo "Existing Containers"
echo "=========================="
echo $containers

if [[ $containers == *"rabbit"* ]]; then
    echo "Stopping Existing Containers"
    echo "=========================="
    docker stop rabbit
    docker rm rabbit
fi
echo

echo "Starting Container"
echo "=========================="
docker run -d --name rabbit -it -p 5672:5672 -p 15672:15672 rabbitmq