#!/bin/sh

cd $(dirname $0)

if [ -z "$1" ]; then
    echo "Please provide a client name."
    exit -1
fi

openssl genrsa -out ~/.docker/$1.key 4096
openssl req -new -key ~/.docker/$1.key -out ~/.docker/$1.csr

openssl x509 -req -in ~/.docker/$1.csr -CAcreateserial -CA ../secrets/docker/ca.crt -CAkey ../secrets/docker/ca.key -out ~/.docker/$1.cert

echo "Please remember to add the new cert to the config file and run \"./usecert.sh $1\" if necessary"