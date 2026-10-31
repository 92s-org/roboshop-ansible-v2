#!/bin/bash
# run.sh — usage: ./run.sh catalogue
COMPONENT=$1
LOG_DIR=./logs
mkdir -p $LOG_DIR

if [ -z "$COMPONENT" ]; then
    echo "Usage: $0 <component>"
    exit 1
fi

export ANSIBLE_LOG_PATH=$LOG_DIR/$COMPONENT-$(date +%F-%H-%M-%S).log
ansible-playbook -i inventory.ini $COMPONENT.yaml
echo "Log file: $ANSIBLE_LOG_PATH"