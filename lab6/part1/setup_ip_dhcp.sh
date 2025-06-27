#!/bin/sh

INTERFACE="$1"

udhcpc -i "$INTERFACE" -v -b

while ! ip a show "$INTERFACE" | grep -q "inet "; do
    sleep 1
done
