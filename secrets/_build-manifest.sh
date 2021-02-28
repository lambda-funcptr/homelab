#!/bin/sh

for SECRET_SCRIPT in $(find . -name "_secrets.sh" -type f); do
    sh "$SECRET_SCRIPT"
done

ls -R $(dirname $0) > $(dirname $0)/_MANIFEST