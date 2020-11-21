#!/bin/sh

cd $(dirname $0)

if [ -z "$1" ]; then
    echo "Please provide a client name."
    exit -1
fi

sudo mkdir -p /etc/docker/certs.d/docker.fnptr.net/
sudo cp ~/.docker/workstation.key /etc/docker/certs.d/docker.fnptr.net/client.key
sudo cp ~/.docker/workstation.cert /etc/docker/certs.d/docker.fnptr.net/client.cert
sudo sh -c "openssl s_client -showcerts -connect docker.fnptr.net:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/docker/certs.d/docker.fnptr.net/ca.crt"

sudo chmod -R 600 /etc/docker/certs.d/docker.fnptr.net/

sudo systemctl restart docker