#!/bin/bash

export CERTIFICATES=$(cat CERTIFICATES)

docker compose up -d && docker compose logs -f