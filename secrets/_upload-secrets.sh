#!/bin/sh

cd $(dirname $0)

# Let's make sure the manifest is up to date.
sh _build-manifest.sh

kubectl apply -Rf manifests