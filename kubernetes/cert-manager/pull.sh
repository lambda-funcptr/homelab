#!/bin/sh

mkdir -p _pull

cd $(dirname $0)

echo "_cert-manager-dist" > .gitignore

rm -rf _cert-manager-dist || true
mkdir _cert-manager-dist
cd _cert-manager-dist

wget https://github.com/jetstack/cert-manager/releases/download/v1.1.0/cert-manager.yaml