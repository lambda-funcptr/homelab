#!/bin/sh
# Enter the right directory.
SETUP_DIR=$(dirname $0)
PLAYBOOK=configure.yaml

cd $SETUP_DIR

if [ ! -z $1 ]; then
    PLAYBOOK=$1
fi

ansible-playbook -i inventory --private-key ../secrets/ansible $PLAYBOOK