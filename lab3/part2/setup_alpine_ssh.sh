#!/bin/sh
mkdir /root/.ssh
cp /tmp/netlab1.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

# apk update > /dev/null
# apk add openssh tcpdump > /dev/null

ssh-keygen -A
/usr/sbin/sshd -D &

