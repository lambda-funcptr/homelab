#!/bin/sh

cd $(dirname $0)

echo "_haproxy-ingress-dist" > .gitignore

rm -rf _haproxy-ingress-dist || true
mkdir -p _haproxy-ingress-dist

cd _haproxy-ingress-dist

wget https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/v1.5/deploy/haproxy-ingress.yaml
wget https://github.com/haproxytech/kubernetes-ingress/blob/master/LICENSE