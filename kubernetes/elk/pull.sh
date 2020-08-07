#!/bin/sh

cd $(dirname $0)

echo "_elk-dist" > .gitignore

rm -rf _elk-dist || true
mkdir -p _elk-dist

cd _elk-dist

wget https://download.elastic.co/downloads/eck/1.2.0/all-in-one.yaml