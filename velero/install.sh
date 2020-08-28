#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero install \
    --provider aws \
    --plugins velero/velero-plugin-for-aws:v1.0.0 \
    --bucket kubernetes-backup \
    --use-volume-snapshots=false \
    --backup-location-config region=minio,s3ForcePathStyle="true",s3Url=https://10.4.255.250:9000,insecureSkipTLSVerify=true \
    --secret-file secrets/minio

bin/opt/velero plugin add openebs/velero-plugin:1.9.0 