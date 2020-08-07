#!/bin/bash

cd $(dirname $0)

echo "_openebs-dist" > .gitignore

rm -rf _openebs-dist || true
mkdir _openebs-dist
cd _openebs-dist

# Pull kubevirt itself.
wget https://openebs.github.io/charts/openebs-operator.yaml
wget https://raw.githubusercontent.com/openebs/openebs/master/LICENSE