VIRTCTL_VERSION=v0.26.1

cd $(dirname $0)

wget https://github.com/kubevirt/kubevirt/releases/download/${VIRTCTL_VERSION}/virtctl-${VIRTCTL_VERSION}-linux-x86_64 -O virtctl

chmod a+x virtctl