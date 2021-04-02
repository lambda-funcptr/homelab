#!/bin/bash

set -e

while read -r DOMAIN_ARGS; do
    if [ "$DOMAIN_ARGS" != "---" ]; then
        certbot certonly --standalone --non-interactive --keep-until-expiring --renew-with-new-domains \
            --pre-hook "systemctl stop lighttpd" --post-hook "systemctl start lighttpd; systemctl reload nginx" \
            --agree-tos --register-unsafely-without-email $DOMAIN_ARGS -d $(hostname -f)
    fi
done < /srv/certs.cfg