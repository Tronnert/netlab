## Network lab - Vlan, DHCP, NAT, DNS, SIP

Done in containerlab https://containerlab.dev/

Simple network, based on alpine containers and Arista cEOS switches.

### Requirements and builds

1. [containerlab](https://containerlab.dev/) version 0.68.0. I installed it via arch aur [package](https://aur.archlinux.org/packages/containerlab).
2. Arsita cEOS. You can get it [here]().
3. Docker. All Dockerfiles are located in `dockerfiles`. To build docker images (and add cEOS image) use `docker_build_images.sh`.
4. [Jinja](https://jinja.palletsprojects.com/en/stable/). It's a python framework for templates. You can install it via `pip` or `pacman -S python-jinja` of you're using arch. Use `prepare.sh` to build all templates (but you're maybe will have different name of jinja in your system).

To deploy lab use `containerlab deploy --reconfigure`. To destroy lab use `containerlab destroy --cleanup`.

### Features

This lab has 39 containers in total.

1. One Arista L3 switch (router1). Connected to 3 L2 switches, DHCP/DNS server, NAT server. Configured via `setups/setup_router1.cfg`. Manages 6 vlans - 10.10.0.0/8 is vlan 10; 10.20.0.0/8 is 20 and to on. Vlan 60 is "service" vlan.
2. Three L2 arsita switches. All connected to router via RortChannel (2 ethernet links). All devices in vlan from 10 to 50 connected to them. 
3. DHCP/DNS server - ISC DHCP configured via `setups/setup_dhcp.sh` and `configs/dhcpd.conf`. Ip range is from 100 to 200. \
DNS is BIND9, configured via `setups/setup_dns.sh` and `configs/named.conf`. Forward-mapped and reverse-mapped zone files is `configs/db.local.com` and `configs/db.10.10.0`. Statically binds test.local.com to 10.10.0.10. 
4. NAT server. Configured via iptables `setups/setup_nat.sh`. Configues port forwarding from tcp 80, 443 to 10.10.0.10; udp/tcp 53 to 10.60.0.1 (dns server). Gateway to the world is macvlan - so it doesn't work with WIFI interfaces
5. SIP. All devices inside vlan 30 are considered to be "phones". So they have builded baresip. Baresip configured via `setups/setup_phone.sh`. To make a "call" from one phone launch baresip and `/dial <phone_hostname>@<phone_ip>.

I also planned adding printers and cameras as "virtual" devises, similar to phones.


