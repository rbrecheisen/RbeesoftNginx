#!/bin/bash

if [ "$1" == "" ]; then
    echo "Usage: run.sh [--ui|--backend|--test]"
    exit 0
fi

export VERSION=$(cat VERSION)

if [ "$1" == "--ui" ]; then

    export REACT_APP_VERSION=${VERSION}
    export REACT_APP_API_BASE_URL=http://localhost:8001
    cd rbeesoftapptemplate/src/rbeesoftapptemplate/ui
    npm install
    npm start --verbose

elif [ "$1" == "--backend" ]; then

    cd rbeesoftapptemplate
    briefcase dev

elif [ "$1" == "--test" ]; then

    export PORT=8001
    cd rbeesoftapptemplate
    briefcase dev --test
fi