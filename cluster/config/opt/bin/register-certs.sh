#!/bin/sh

mkdir -p /etc/docker/certs.d/harbor.fnptr.net/
sh -c "openssl s_client -showcerts -connect harbor.fnptr.net:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/docker/certs.d/harbor.fnptr.net/ca.crt"
chmod -R 600 /etc/docker/certs.d/harbor.fnptr.net/