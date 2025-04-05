#!/bin/bash

export VERSION=$(cat VERSION)
export CERTIFICATES=$(cat CERTIFICATES)

if [ "${1}" != "" ]; then
    docker compose logs -f ${1}
else
    docker compose logs -f
fi
