#!/bin/sh

ip route del default
ip route add default via 10.20.0.1
