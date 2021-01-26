#!/bin/bash

set -e

echo -n "Password for debian@$1:"
read -s PASS

cd $(dirname $0)
ssh-copy-id -i ../../secrets/ansible debian@$1
ssh -i ../../secrets/ansible debian@$1 $(echo "echo \"$PASS\" | sudo -S sh -c \"echo 'debian ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/custom\"")
ssh -i ../../secrets/ansible debian@$1 "sudo passwd -d debian"