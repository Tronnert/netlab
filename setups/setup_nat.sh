ip addr add 10.60.0.2/24 dev eth2

ip route add 10.10.0.0/24 via 10.60.0.254 dev eth2
ip route add 10.20.0.0/24 via 10.60.0.254 dev eth2
ip route add 10.30.0.0/24 via 10.60.0.254 dev eth2
ip route add 10.40.0.0/24 via 10.60.0.254 dev eth2
ip route add 10.50.0.0/24 via 10.60.0.254 dev eth2

ip route del default

sysctl -w net.ipv4.ip_forward=1

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 443 -j DNAT --to-destination 10.10.0.10:443
ptables -A FORWARD -p tcp -d 10.10.0.10 --dport 443 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to-destination 10.10.0.10:80
iptables -A FORWARD -p tcp -d 10.10.0.10 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -i eth1 -p udp --dport 53 -j DNAT --to-destination 10.60.0.1:53
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 53 -j DNAT --to-destination 10.60.0.1:53

iptables -A FORWARD -p udp -d 10.60.0.1 --dport 53 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp -d 10.60.0.1 --dport 53 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


echo "nameserver 10.60.0.1" > /etc/resolv.conf
