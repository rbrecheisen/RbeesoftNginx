#!/bin/bash

export VERSION=$(cat VERSION)
export CERTIFICATES=$(cat CERTIFICATES)

if [ "${1}" == "--all" ]; then
    # docker compose down
    docker compose down --volumes --remove-orphans
    docker container prune -f && docker volume prune -f
    docker system prune -f
else
    docker compose down rbeesoftapptemplate-backend
fi