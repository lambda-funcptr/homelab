#!/bin/sh

cd $(dirname $0)

# Plex token
kubectl create secret generic -n media plex-claim-token --from-file=token=plex-claim --dry-run=client -o yaml > plex-claim-token.yaml