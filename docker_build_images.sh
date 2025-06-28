sudo docker import cEOS-lab-4.34.1F.tar.xz ceos:4.34.1F

sudo docker build -t dima/ubuntu-hub -f dockerfiles/Dockerfile_ubuntu_hub .

sudo docker build -t dima/alpine-pc -f dockerfiles/Dockerfile_alpine_ssh .
sudo docker build -t dima/alpine-phone -f dockerfiles/Dockerfile_alpine_phone .
sudo docker build -t dima/alpine-dhcp-dns -f dockerfiles/Dockerfile_dhcp_dns_server .
sudo docker build -t dima/alpine-nat -f dockerfiles/Dockerfile_nat_server .
sudo docker build -t dima/alpine-flask -f dockerfiles/Dockerfile_flask_server .

