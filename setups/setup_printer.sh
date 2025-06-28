#!/bin/sh

ip route del default
ip route add default via 10.20.0.1

echo "nameserver 10.60.0.1" > /etc/resolv.conf
