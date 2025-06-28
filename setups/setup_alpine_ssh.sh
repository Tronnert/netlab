#!/bin/sh
mkdir /root/.ssh
cp /tmp/netlab1.pub /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

ssh-keygen -A
/usr/sbin/sshd -D &

