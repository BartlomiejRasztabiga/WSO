nmcli connection delete netplan-enp3s0
nmcli connection add type bridge ifname br0 con-name br0
nmcli connection add type ethernet ifname enp3s0 master br0
nmcli connection up br0
