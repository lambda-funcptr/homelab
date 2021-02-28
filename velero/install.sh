#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.0.0 \
    --bucket k8s-backup \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=http://s3.velero.svc.k8s.fnptr.net \
    --secret-file secrets/velero/minio \
    --use-restic

bin/opt/velero plugin add openebs/velero-plugin:latest

kubectl apply -f velero/volume-snapshots.yaml