#!/bin/sh

ip route del default
ip route add default via 10.50.0.1
