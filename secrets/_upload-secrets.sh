#!/bin/sh

cd $(dirname $0)

kubectl create secret generic -n media plex-claim-token --from-file=token=plex-claim --dry-run=client -o yaml | kubectl apply -f -