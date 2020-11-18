#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.1.0 \
    --bucket fnptr-k8s-backup \
    --backup-location-config region=us-west-000,s3ForcePathStyle="true",s3Url=https://s3.us-west-000.backblazeb2.com \
    --secret-file secrets/backup/backblaze \
    --use-restic

bin/opt/velero plugin add openebs/velero-plugin:latest

kubectl apply -f velero/backblaze-volume-snapshots.yaml