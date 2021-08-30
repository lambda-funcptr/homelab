#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero schedule create volume-backups --schedule="@every 24h" --ttl 2160h0m0s -l backup=true --snapshot-volumes --volume-snapshot-locations=backblaze-b2
