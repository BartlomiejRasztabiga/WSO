nmcli connection add type bridge autoconnect yes con-name br0 ifname br0
nmcli connection add type ethernet autoconnect yes con-name br0-slave ifname enp3s0 master br0
nmcli connection modify br0 ipv4.method auto ipv6.method ignore
sudo ufw disable