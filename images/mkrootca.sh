#!/bin/sh

cd $(dirname $0)

if [ -e ../secrets/docker ]; then
    echo "Docker certificates already generated! If you want to regenerate the root CA, delete secrets/docker."
fi

mkdir -p ../secrets/docker

openssl genrsa -out ../secrets/docker/ca.key 4096
openssl req -new -nodes -x509 -text -key ../secrets/docker/ca.key -out ../secrets/docker/ca.crt
cp ../secrets/docker/ca.crt config/docker-registry/ca.crt