# Homelab setup

This is the repo that holds my homelab/homeprod* setup. 
Although it's just for show (mostly), it should be able to create a working k8s cluster anywhere (with modifications) without much issue.

Since I don't want to be redistributing portions unmodified other people's code, I've removed them from the git repository via per-directory `.gitignores`.

**In order to pull the required external dependencies, execute** `./pull-external.sh`.

## Contents

### > `bin`

Where context-independent scripts and their ilk go. 

Commands are mostly self-explanatory. 
Invoking a script without any arguments will print a short usage explanation.

### > `cluster-setup`

Initial cluster setup, configuration, and also a teardown playbook (`cluster-setup/99_teardown_cluster.yaml`, untested).

The main setup script is located in `cluster-setup/setup.sh`.

### > `kubernetes`

Declarative idempotent kubernetes objects for management/features/whatever.
It should be fine to do run `kubectl apply -Rf kubernetes` to it.

It's probably a good idea to run this before running anything else (e.g. helm charts).

### > `services`

Probably where I'll put stuff like apps (e.g. Plex, and uh... more Plex) deployments.

### > `secrets`

Things to do with keys and what not. Has its own .gitignore in order to control what gets pushed.

## Shoutouts

Thanks to:
- Homelab Discord for making me feel bad about my lab choices regardless of what I do
- Lucratiel from te Homelab Discord for inspiring me to ~~waste my life on~~ use Kubernetes 
- Watcher7 from the Homelab Discord for telling me about MetalLB
- kroy from the Homelab Discord for being an all around cool dude.
- Liam Silvers for pointing out that I can't spell "secrets".
- David S (Lem/This Is Temporary) for trying his best to dissuade me from doing this.