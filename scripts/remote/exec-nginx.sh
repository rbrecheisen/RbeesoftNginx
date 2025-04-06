#!/bin/bash

export CERTIFICATES=$(cat CERTIFICATES)

docker compose exec rbeesoft-nginx sh
