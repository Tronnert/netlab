ip link add link eth1 name eth1.10 type vlan id 10
ip link add link eth1 name eth1.20 type vlan id 20
ip link add link eth1 name eth1.30 type vlan id 30
ip link add link eth1 name eth1.40 type vlan id 40
ip link add link eth1 name eth1.50 type vlan id 50
ip link add link eth1 name eth1.60 type vlan id 60

# ip addr add 10.10.0.254/24 dev eth1.10 
# ip addr add 10.20.0.254/24 dev eth1.20 
# ip addr add 10.30.0.254/24 dev eth1.30 
# ip addr add 10.40.0.254/24 dev eth1.40 
# ip addr add 10.50.0.254/24 dev eth1.50 
ip addr add 10.60.0.1/24 dev eth1.60 
ip link set eth1.10 up
ip link set eth1.20 up
ip link set eth1.30 up
ip link set eth1.40 up
ip link set eth1.50 up
ip link set eth1.60 up

echo 'INTERFACESv4="eth1.10 eth1.20 eth1.30 eth1.40 eth1.50 eth1.60"' > /etc/default/isc-dhcp-server

touch /var/lib/dhcp/dhcpd.leases

dhcpd -4 -d eth1.10 eth1.20 eth1.30 eth1.40 eth1.50 eth1.60 &
