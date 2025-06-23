IP=$(ip -4 -o addr show dev eth1 | awk '{print $4}' | cut -d/ -f1)

echo 'q' | baresip -f /root/.baresip

sed -i "s|^[#]*sip_listen.*|sip_listen\t\t$IP:5060|" "/root/.baresip/config"

echo "<sip:$(hostname)@$IP>;regint=0" >> /root/.baresip/accounts
