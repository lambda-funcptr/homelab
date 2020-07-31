#!/bin/bash

KUBEVIRT_VERS=v0.26.0

cd $(dirname $0)

rm -r kubevirt-dist
mkdir kubevirt-dist
cd kubevirt-dist
wget https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERS}/kubevirt-operator.yaml -O 00_kubevirt-operator.yaml
wget https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERS}/kubevirt-cr.yaml -O 01_kubevirt-cr.yaml
wget https://raw.githubusercontent.com/kubevirt/kubevirt/master/LICENSE