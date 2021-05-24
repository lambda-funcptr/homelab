#!/bin/bash

set -e

echo -n "Password for ubuntu@$1:"
read -s PASS

cd $(dirname $0)
ssh-copy-id -i ../../secrets/ansible ubuntu@$1
ssh -i ../../secrets/ansible ubuntu@$1 $(echo "echo \"$PASS\" | sudo -S sh -c \"echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/custom\"")
ssh -i ../../secrets/ansible ubuntu@$1 "sudo passwd -d ubuntu"
