#!/bin/bash

# $1 = docker_name
# $2 = repo_name
# $3 = commit_id
if [ "$(docker ps -q -f name=$1)" ]; then
    docker stop $1
else
    docker run -p 80:1080 -d --rm --name $1 $2:$3
fi
