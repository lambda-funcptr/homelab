# Homelab setup

This is the repo that holds my homelab/homeprod* setup. 
Although it's just for show (mostly), it should be able to create a working k8s cluster anywhere (with modifications) without much issue.

## Contents

### bin

Where context-independent scripts and their ilk go.

### cluster-setup

Initial cluster setup, configuration, and also a teardown playbook (cluster-setup/99_teardown_cluster.yaml, untested).

The main setup script is located in `cluster-setup/setup.sh`.

### kubernetes

Declarative idempotent kubernetes objects.
It should be fine to do run `kubectl apply -Rf kubernetes` to it.

### secretes

Things to do with keys and what not. Has its own .gitignore in order to control what gets pushed.