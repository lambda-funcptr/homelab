#!/bin/sh

wg addconf wgsdn /etc/wireguard/wgsdn-peers.conf
ip route add 10.2.64.64/32 dev wgsdn