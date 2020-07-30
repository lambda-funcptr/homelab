#!/bin/sh

# Prep the host and install kubernetes.
ansible-playbook -i k8s-hosts --private-key ../secrets/ansible setup.yaml