#!/bin/bash

cd $(dirname $0)

echo "cert-manager-dist" > .gitignore

rm -rf cert-manager-dist || true
mkdir cert-manager-dist
cd cert-manager-dist 

# Pull kubevirt itself.
wget https://github.com/jetstack/cert-manager/releases/download/v0.16.1/cert-manager.yaml