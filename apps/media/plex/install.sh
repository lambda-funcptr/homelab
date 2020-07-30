#!/bin/sh

cd $(dirname $0)

PLEX_CLAIM=$(cat ../../../secrets/plex-claim)

cd kube-plex

helm install plex ./charts/kube-plex \
    --namespace media \
    --set claimToken=$PLEX_CLAIM \
    --set ingress.enabled=true