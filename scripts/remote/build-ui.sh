#!/bin/bash

PWD=$(pwd)

APP_NAME=rbeesoftapptemplate

# This exported ENV variables are needed for the React frontend
export VERSION=$(cat VERSION)
# export SCHEMA=http
export SCHEMA=https
export REACT_APP_VERSION=${VERSION}
export REACT_APP_API_BASE_URL="${SCHEMA}://${APP_NAME}.rbeesoft-apps.nl"

cd ${APP_NAME}/src/${APP_NAME}/ui

npm install
npm run build

cd $PWD
