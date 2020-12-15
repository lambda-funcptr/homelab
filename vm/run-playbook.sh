#!/bin/sh
cd "$(dirname $0)"

if [ -z "$1" ]; then
    echo "Please specify playbook set to use."
    exit -1
fi

PLAYBOOK="playbook.yaml"

if [ ! -z "$2" ]; then
    PLAYBOOK="$2"
fi

# Prep the host and install kubernetes.
ansible-playbook -i "$1/hosts.yaml" --private-key ../secrets/ansible "$1/$PLAYBOOK"