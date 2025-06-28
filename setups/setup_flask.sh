#!/bin/sh

ip addr add 10.10.0.10/24 dev eth1

ip route del default
ip route add default via 10.10.0.1

echo "nameserver 10.60.0.1" > /etc/resolv.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/test.local.key \
  -out /etc/ssl/certs/test.local.crt \
  -subj "/CN=test.local.com"

mkdir -p /var/log/nginx
touch /var/log/nginx/error.log
chown -R nginx:nginx /var/log/nginx
cp /tmp/nginx.conf /etc/nginx

while ! getent hosts test.local.com >/dev/null 2>&1; do
    sleep 1
done

nginx

flask --app /tmp/test.py run --host=0.0.0.0 &
