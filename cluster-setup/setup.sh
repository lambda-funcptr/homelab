#!/bin/sh
# Enter the right directory.
SETUP_DIR=$(dirname $0)
cd $SETUP_DIR

# Prep the host and install kubernetes.
ansible-playbook -i k8s-hosts --private-key ../secrets/ansible setup.yaml