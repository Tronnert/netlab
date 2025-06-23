#!/bin/bash
mkdir /root/.ssh
cp /tmp/netlab1.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

# apt-get update > /dev/null
# DEBIAN_FRONTEND=noninteractive apt-get install -y iproute2 iputils-ping openssh-server mtr tcpdump > /dev/null
service ssh start

ip link add br0 type bridge
ip link set br0 up

for iface in eth1 eth2 eth3 eth4 eth5 eth6; do
  ip link set "$iface" up
  ip link set "$iface" master br0
  bridge link set dev "$iface" learning off
  bridge link set dev "$iface" flood on
done