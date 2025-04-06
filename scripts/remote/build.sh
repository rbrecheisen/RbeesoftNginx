#!/bin/bash

export CERTIFICATES=$(cat CERTIFICATES)

docker compose build --no-cache
docker system prune -f
