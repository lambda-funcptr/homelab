#!/bin/sh

mkdir -p ~/.ssh

wget https://raw.githubusercontent.com/lambda-funcptr/homelab/master/secrets/ansible.pub -O ~/.ssh/authorized_keys

apk add python3