#!/bin/sh

cd $(dirname $0)

# Let's make sure the manifest is up to date.
sh _build-manifest.sh

kubectl create secret generic -n media plex-claim-token --from-file=token=plex-claim --dry-run=client -o yaml | kubectl apply -f -

# Upload the authbind password to the infrastructure namespace.
kubectl create secret generic -n infrastructure ldap-authbind --from-file=password=ldap-authbind --dry-run=client -o yaml | kubectl apply -f -