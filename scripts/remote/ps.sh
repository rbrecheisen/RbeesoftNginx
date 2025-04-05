#!/bin/bash

export VERSION=$(cat VERSION)
export CERTIFICATES=$(cat CERTIFICATES)

if [ "${1}" != "" ]; then
    docker compose ps ${1}
else
    docker compose ps
fi
