#!/bin/sh

cd $(dirname $0)

kubectl create secret generic -n media plex-claim-token --from-file=token=../../../secrets/plex-claim