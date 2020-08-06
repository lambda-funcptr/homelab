#!/bin/sh

cd $(dirname $0)

echo "elk-dist" > .gitignore

rm -rf elk-dist || true
mkdir -p elk-dist

cd elk-dist

wget https://download.elastic.co/downloads/eck/1.2.0/all-in-one.yaml