#!/bin/bash

KUBEVIRT_VERS=v0.26.0

cd $(dirname $0)

rm -r kubevirt-dist
mkdir kubevirt-dist
cd kubevirt-dist

# Pull kubevirt itself.
wget https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERS}/kubevirt-operator.yaml -O 00_kubevirt-operator.yaml
wget https://github.com/kubevirt/kubevirt/releases/download/${KUBEVIRT_VERS}/kubevirt-cr.yaml -O 01_kubevirt-cr.yaml
wget https://raw.githubusercontent.com/kubevirt/kubevirt/master/LICENSE -O LICENSE.kubevirt

# Pull kubevirt-CDI for image imports.
CDI_VERSION=$(curl -s https://github.com/kubevirt/containerized-data-importer/releases/latest | grep -o "v[0-9]\.[0-9]*\.[0-9]*")
wget https://github.com/kubevirt/containerized-data-importer/releases/download/$CDI_VERSION/cdi-operator.yaml -O 10_cdi-operator.yaml
wget https://github.com/kubevirt/containerized-data-importer/releases/download/$CDI_VERSION/cdi-cr.yaml -O 11_cdi-operator-cr.yaml
wget https://raw.githubusercontent.com/kubevirt/containerized-data-importer/master/LICENSE -O LICENSE.cdi