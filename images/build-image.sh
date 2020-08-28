#!/bin/sh

cd $(dirname $0)

if [ -z $1 ]; then
    echo "Usage: ./build-image image-name"
    exit -1;
fi

if [ ! -f $1/config ]; then
    echo "No configuration for image $1, aborting";
    exit -1;
fi

if [ ! -f $1/install ]; then
    echo "No install scripts for image $1, aborting.";
    exit -1;
fi

# Deleting existing image, it's fine if no image exists, so we suppress the output.
kubectl -n images delete dv/$1 > /dev/null 2>&1
kubectl -n images wait dv/$1 --for=condition=Deleted --timeout=1m > /dev/null 2>&1

echo "Creating VMI"

source $1/config

cat <<EOF | kubectl apply -f -
apiVersion: cdi.kubevirt.io/v1beta1
kind: DataVolume
metadata:
  name: $1-iso-dv
  namespace: images
spec:
  source:
    http:
        url: "$IMAGE_URL"
  pvc:
    volumeMode: Block
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: $IMAGE_SIZE
    storageClassName: openebs-sc-hdd
---
apiVersion: cdi.kubevirt.io/v1beta1
kind: DataVolume
metadata:
  name: $1
  namespace: images
spec:
  source:
    blank: {}
  pvc:
    volumeMode: Block
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: $IMAGE_SIZE
    storageClassName: openebs-sc-hdd
---
apiVersion: kubevirt.io/v1alpha3
kind: VirtualMachineInstance
metadata:
  name: $1
  labels:
    image: $1
  namespace: images
spec:
  domain:
    cpu:
      cores: 1
    resources:
      requests:
        memory: 256Mi
    devices:
      disks:
      - disk:
          bus: virtio
        name: iso
      - disk:
          bus: virtio
        name: disk
  terminationGracePeriodSeconds: 0
  volumes:
  - name: disk
    dataVolume:
      name: $1
  - name: iso
    dataVolume:
      name: $1-iso-dv
EOF

echo "Waiting for VMI pod to be ready"

kubectl wait -n images vmi $1 --for=condition=Ready --timeout=1h

screen -X -S build-image-$1 quit > /dev/null 2>&1
screen -S build-image-$1 -d -m ../bin/opt/virtctl console -n images $1

echo "Connected to console; delaying for boot sequence"

echo "Executing install script"
sleep 20

screen -S build-image-$1 -p 0 -X stuff $IMAGE_USER
screen -S build-image-$1 -p 0 -X stuff "^M"
sleep 10
screen -S build-image-$1 -p 0 -X stuff $IMAGE_PASS
screen -S build-image-$1 -p 0 -X stuff "^M"
sleep 10

screen -S build-image-$1 -p 0 -X stuff "echo $(cat $SSH_KEY_FILE) | tr '\\n' ' ' | tee /tmp/sshkey"
screen -S build-image-$1 -p 0 -X stuff "^M"

screen -S build-image-$1 -p 0 -X stuff "$(cat $1/install)"

echo "Waiting for configured build duration"
sleep $BUILD_DURATION;

echo "Deleting temporaries"
screen -S build-image-ssh-$1 -p 0 -X stuff "^C"
screen -X -S build-image-$1 quit > /dev/null 2>&1
screen -X -S build-image-ssh-$1 quit > /dev/null 2>&1
#rm -rf /tmp/build-image
#kubectl -n images delete dv/$1-iso-dv vmi/$1