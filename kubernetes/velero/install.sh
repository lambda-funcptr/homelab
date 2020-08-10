#!/bin/sh

cd $(dirname)/../../

bin/vendor/velero install \
    --provider aws\
    --plugins velero/velero-plugin-for-aws:v1.1.0,openebs
    --bucket kubernetes-block
    --backup-location-config region=us-west-000,s3Url=s3.us-west-000.backblazeb2.com
    --snapshot-location-config region=us-west-000,s3Url=s3.us-west-000.backblazeb2.com
    --secret-file secrets/velero-backblaze