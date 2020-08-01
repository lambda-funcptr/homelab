#!/bin/bash

cd $(dirname $0)

echo "openebs-dist" > .gitignore

rm -rf openebs-dist || true
mkdir openebs-dist
cd openebs-dist

# Pull kubevirt itself.
wget https://openebs.github.io/charts/openebs-operator.yaml
wget https://raw.githubusercontent.com/openebs/openebs/master/LICENSE