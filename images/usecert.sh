#!/bin/sh

cd $(dirname $0)

sudo mkdir -p /etc/docker/certs.d/harbor.fnptr.net/
sudo sh -c "openssl s_client -showcerts -connect harbor.fnptr.net:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/docker/certs.d/harbor.fnptr.net/ca.crt"

sudo chmod -R 600 /etc/docker/certs.d/harbor.fnptr.net/

sudo systemctl restart docker