VIRTCTL_VERSION=v0.26.1
VELERO_VERSION=v1.4.2

cd $(dirname $0)

wget https://github.com/kubevirt/kubevirt/releases/download/${VIRTCTL_VERSION}/virtctl-${VIRTCTL_VERSION}-linux-x86_64 -O virtctl

wget https://github.com/vmware-tanzu/velero/releases/download/${VELERO_VERSION}/velero-${VELERO_VERSION}-linux-amd64.tar.gz -O velero.tar.gz
tar -xzvf velero.tar.gz
cp velero-${VELERO_VERSION}-linux-amd64/velero ./velero
rm velero.tar.gz

chmod a+x virtctl
chmod a+x velero