#!/bin/sh

if [ -z $1 ] || [ -z $2 ]; then
    echo "Usage: ./genkeys [wgvpn|wgcdn] hostname"
    exit -1;
fi

cd $(dirname $0)/../secrets/$1

wg genkey | tee $2 | wg pubkey > $2.pub