#!/bin/bash

export CERTIFICATES=$(cat CERTIFICATES)
export REACT_APP_API_BASE_URL="https://test.rbeesoft-apps.nl"

SERVICE_NAME=${1}

docker compose up -d ${SERVICE_NAME} && docker compose logs -f ${SERVICE_NAME}