#!/bin/sh

cd $(dirname $0)

# Plex token
kubectl create secret generic -n media plex-claim-token --from-file=token=plex-claim --dry-run=client -o yaml | kubectl apply -f -

# Bookstack DB-related secrets
kubectl apply -f bookstack-secrets.yaml