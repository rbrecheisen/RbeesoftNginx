#!/bin/bash

if [ "$1" == "" ]; then
    echo "Deploys NGINX to production"
    echo "Usage: deploy.bat [--prod]"
    exit 0
fi

export VERSION=$(cat VERSION)

PROJECT_NAME=RbeesoftNginx
APP_NAME=rbeesoftapptemplate
PRIVATE_KEY=/Users/ralph/.ssh/Hostnet_VPS_private
SSH_IP=185.95.13.93
SSH_ROOT=root@${SSH_IP}
SSH_RALPH=ralph@${SSH_IP}

if [ "$1" == "--prod" ]; then
    echo "Deploying NGINX reverse proxy (version ${VERSION}) to production..."
    read -n 1 -s -r -p "Press any key to continue..."
    git add -A && git commit -m "Deploying ${APP_NAME} version ${VERSION}" && git push
    ssh -i ${PRIVATE_KEY} ${SSH_RALPH} "~/clone-project.sh ${PROJECT_NAME} && cd ~/dev/${PROJECT_NAME} && chmod +x scripts/remote/*.sh"
    ssh -i ${PRIVATE_KEY} ${SSH_RALPH} "cd /home/ralph/dev/${PROJECT_NAME} && scripts/remote/build-ui.sh"
    ssh -i ${PRIVATE_KEY} ${SSH_ROOT} "cd /home/ralph/dev/${PROJECT_NAME} && scripts/remote/shutdown.sh --all"
    ssh -i ${PRIVATE_KEY} ${SSH_ROOT} "cd /home/ralph/dev/${PROJECT_NAME} && scripts/remote/build.sh --all"
    ssh -i ${PRIVATE_KEY} ${SSH_ROOT} "cd /home/ralph/dev/${PROJECT_NAME} && scripts/remote/run.sh --all"
fi