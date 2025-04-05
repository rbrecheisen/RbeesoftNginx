#!/bin/bash

export VERSION=$(cat VERSION)
export CERTIFICATES=$(cat CERTIFICATES)

if [ "${1}" == "--all" ]; then
    docker compose build --no-cache
else
    docker compose build --no-cache rbeesoftapptemplate-backend
fi

docker system prune -f
