#!/bin/sh
# Enter the right directory.
SETUP_DIR=$(dirname $0)
PLAYBOOK=configure-metal.yaml

cd $SETUP_DIR

if [ ! -z $1 ]; then
    PLAYBOOK=$1
fi

# Prep all bare metal nodes for configuration
ansible-playbook -i inventory --private-key ../secrets/ansible $PLAYBOOK