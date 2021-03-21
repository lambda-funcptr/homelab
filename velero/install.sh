#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.0.0,openebs/velero-plugin:1.11.0 \
    --bucket fnptr-k8s-backup \
    --backup-location-config region=us-west-000,s3ForcePathStyle="true",s3Url=https://s3.us-west-000.backblazeb2.com \
    --secret-file secrets/velero/backblaze \
    --use-restic

kubectl apply -f velero/volume-snapshots.yaml