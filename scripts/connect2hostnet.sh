#!/bin/bash

USER=ralph
if [ "$1" == "--root" ]; then
    USER=root
fi

PRIVATE_KEY=/Users/ralph/.ssh/Hostnet_VPS_private
SSH_IP=185.95.13.93
PROJECT_NAME=RbeesoftAppTemplate

ssh -t -i ${PRIVATE_KEY} ${USER}@${SSH_IP} "cd /home/ralph && bash -i"