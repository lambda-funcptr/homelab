# Homelab setup

This is the repo that holds my homelab/homeprod* setup. 
Although it's just for show (mostly), it should be able to create a working k8s cluster anywhere (with modifications) without much issue.

Since I don't want to be redistributing portions unmodified other people's code, I've removed them from the git repository via per-directory `.gitignores`.

**In order to pull the required external dependencies, execute** `./configure.sh`.

## Contents

### > `bin`

Where context-independent scripts and their ilk go. 

Commands are mostly self-explanatory. 
Invoking a script without any arguments will print a short usage explanation.

### > `cloud`

Stuff pertaining to lab-related VPSes or other cloud-related services (mostly OVH right now).

Currently just wgvpn, which is my wireguard vpn and wgcdn, which is my wireguard based CDN mechanism, as well as [funcptr.org].

### > `cluster`

Initial cluster setup, configuration, management, and also a teardown playbook (untested).

There's also some playbooks and scripts for setting up remote nodes that get connected via Wireguard + Proxy ARP in there.

The cluster can be set up via `cluster/run-playbook.sh`.

### > `distmc`

Part of my distmc project. It's really dumb. I would not recommend looking at it too hard.

### > `egress`

Part of handling the wgcdn egress.

### > `images`

Custom images for either vms or docker.
Populates a local harbor repository with images via `mkimage.sh`

### > `k8s-ns`

List of kubernetes namespaces. I'm moving it out of kubernetes because of an incident where I deleted all my namespaces.

### > `kubernetes`

Declarative idempotent kubernetes objects for management/features/whatever.
It should be fine to do run `kubectl apply -Rf kubernetes` to it (`bin/apply` actually does this).

It's probably a good idea to run this before running anything else (e.g. helm charts).

### > `openebs-bd`

Manually specified OpenEBS devices. Probably best if ran only once.
Not really sure what happens if a block device gets remade, but I don't want to see what happens if a block device gets claimed twice.

### > `secrets`

Things to do with keys and what not. Has its own .gitignore in order to control what gets pushed.

### > `velero`

Backups via velero. Unfortunately, OpenEBS won't let me snapshot without more redundancy, so I'll need to expand the lab.

### > `vmtools`

VM provisioning and setup scripts

## TODO:

- [ ] Set up a proper SDN solution with point to point wireguard /0 tunnels.
- [ ] Add in the edits made in the kube-router manifests somewhere.

## Shoutouts

Thanks to:
- Homelab Discord for making me feel bad about my lab choices regardless of what I do
- Lucratiel from the Homelab Discord for inspiring me to ~~waste my life on~~ use Kubernetes 
- Watcher7 from the Homelab Discord for telling me about MetalLB
- kroy from the Homelab Discord for being an all around cool dude.
- Liam Silvers for pointing out that I can't spell "secrets".
- David S (Lem/This Is Temporary) for trying his best to dissuade me from doing this.
- BASH from the Homelab Discord for his advice with working with Kubernetes (Ingress, Infra, Management)