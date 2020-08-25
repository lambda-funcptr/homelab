#!/bin/sh
# Enter the right directory.
cd $(dirname $0)

# Prep the host and install kubernetes.
ansible-playbook -i remote-hosts.yaml --private-key ../../secrets/ansible setup-remotes.yaml