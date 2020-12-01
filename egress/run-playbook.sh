#!/bin/sh
# Enter the right directory.
SETUP_DIR=$(dirname $0)
PLAYBOOK=egress.yaml

cd $SETUP_DIR

if [ ! -z $1 ]; then
    PLAYBOOK=$1
fi

# Prep the host and install kubernetes.
ansible-playbook -i hosts.yaml --private-key ../secrets/ansible $PLAYBOOK