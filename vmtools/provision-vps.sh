#!/bin/sh

cd $(dirname $0)
ssh-copy-id -i ../secrets/ansible debian@$1
ssh -i ../secrets/ansible debian@$1 'sudo passwd -d debian'