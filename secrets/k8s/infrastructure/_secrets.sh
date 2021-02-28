#!/bin/sh

cd "$(dirname $0)"

# LDAP authbind password
kubectl create secret generic -n infrastructure ldap-authbind --from-file=password=../../ldap-authbind --dry-run=client -o yaml > ldap-authbind.yaml