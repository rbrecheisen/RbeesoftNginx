#!/bin/bash

export VERSION=$(cat VERSION)
export CERTIFICATES=$(cat CERTIFICATES)

docker compose exec rbeesoftapptemplate-backend bash
