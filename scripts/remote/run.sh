#!/bin/bash

export VERSION=$(cat VERSION)
export CERTIFICATES=$(cat CERTIFICATES)

if [ "${1}" == "--all" ]; then
    docker compose up -d && docker compose logs -f
else
    docker compose up -d rbeesoftapptemplate-backend && docker compose logs -f rbeesoftapptemplate-backend 
fi
