#!/bin/sh

cd $(dirname "$0")

for NAMESPACE_DIR in k8s/generic/*; do
    NAMESPACE=$(realpath --relative-to=k8s/generic "$NAMESPACE_DIR")
    mkdir -p "manifests/$NAMESPACE"
    for SECRET_DIR in ${NAMESPACE_DIR}/*; do
        SECRET=$(realpath --relative-to="$NAMESPACE_DIR" "$SECRET_DIR")
        kubectl create secret -n $NAMESPACE generic $SECRET --from-file=$SECRET_DIR --dry-run=client -o yaml > "manifests/$NAMESPACE/$SECRET.yaml"
    done
done

ls -R $(dirname $0) > $(dirname $0)/_MANIFEST