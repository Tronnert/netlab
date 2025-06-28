#!/bin/sh

cp /tmp/named.conf /etc/bind/
cp /tmp/db.local.com /var/bind/
cp /tmp/db.10.10.0  /var/bind/
named -c /etc/bind/named.conf -g &
