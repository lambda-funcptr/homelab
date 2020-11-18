#!/bin/sh

cd $(dirname $0)/../

bin/opt/velero backup create active-directory -l app=active-directory --snapshot-volumes --volume-snapshot-locations=backblaze
bin/opt/velero backup create grafana -l app=grafana --snapshot-volumes --volume-snapshot-locations=backblaze
