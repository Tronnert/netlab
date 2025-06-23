sudo docker import cEOS-lab-4.34.1F.tar.xz ceos:4.34.1F
sudo docker build -t dima/alpine-pc -f Dockerfile_alpine_ssh .
sudo docker build -t dima/alpine-phone -f Dockerfile_alpine_phone .
sudo docker build -t dima/alpine-dhcp -f Dockerfile_dhcp_server .
sudo docker build -t dima/ubuntu-hub -f Dockerfile_ubuntu_hub .
