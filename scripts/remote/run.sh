#!/bin/bash

export CERTIFICATES=$(cat CERTIFICATES)

SERVICE_NAME=${1}

docker compose up -d ${SERVICE_NAME} && docker compose logs -f ${SERVICE_NAME}