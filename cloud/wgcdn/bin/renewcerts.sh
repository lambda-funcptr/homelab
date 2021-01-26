#!/bin/sh

certbot renew --pre-hook "systemctl stop lighttpd" --post-hook "systemctl start lighttpd; systemctl reload nginx"