#!/bin/sh

cd $(dirname $0)

echo "Generating local docker repository credentials..."

docker login harbor.fnptr.net
# Let's make sure the manifest is up to date.
sh _build-manifest.sh

for UPLOAD_SCRIPT in $(find . -name "_secrets.sh" -type f); do
    sh "$UPLOAD_SCRIPT"
done