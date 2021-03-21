#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero schedule create k8s-backup --schedule="@every 168h" --ttl 2160h0m0s -l backup=true --snapshot-volumes --volume-snapshot-locations=backblaze-b2
