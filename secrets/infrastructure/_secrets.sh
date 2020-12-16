#!/bin/sh

cd "$(dirname $0)"

kubectl create secret generic -n infrastructure regcred \
    --from-file=.dockerconfigjson=$(ls ~/.docker/config.json) \
    --type=kubernetes.io/dockerconfigjson --dry-run=client -o yaml | kubectl apply -f -

# LDAP authbind password
kubectl create secret generic -n infrastructure ldap-authbind --from-file=password=../ldap-authbind --dry-run=client -o yaml | kubectl apply -f -