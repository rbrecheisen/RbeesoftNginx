#!/bin/bash

PROJECT_NAME=RbeesoftNginx
PRIVATE_KEY=/Users/ralph/.ssh/Hostnet_VPS_private
SSH_IP=185.95.13.93
SSH_ROOT=root@${SSH_IP}
SSH_RALPH=ralph@${SSH_IP}

echo "Deploying NGINX reverse proxy to production..."
read -n 1 -s -r -p "Press any key to continue..."

git add -A && git commit -m "Deploying project RbeesoftNginx" && git push

ssh -i ${PRIVATE_KEY} ${SSH_RALPH} "~/clone-project.sh ${PROJECT_NAME} && cd ~/dev/${PROJECT_NAME} && chmod +x scripts/remote/*.sh"
ssh -i ${PRIVATE_KEY} ${SSH_ROOT} "cd /home/ralph/dev/${PROJECT_NAME} && scripts/remote/build.sh"
ssh -i ${PRIVATE_KEY} ${SSH_ROOT} "cd /home/ralph/dev/${PROJECT_NAME} && scripts/remote/run.sh"
