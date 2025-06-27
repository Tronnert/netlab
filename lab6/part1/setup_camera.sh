#!/bin/sh

ip route del default
ip route add default via 10.40.0.1
