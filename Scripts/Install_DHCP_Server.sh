#!/bin/bash

#  Status: Complete/Done
# Purpose:

NEEDRESTART_MODE=a

sudo apt install -y isc-dhcp-server

cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.orig
curl https://raw.githubusercontent.com/cloudxabide/eksa.matrix.lab/main/Files/etc_dhcp_dhcpd.conf | sudo tee /etc/dhcp/dhcpd.conf
curl https://raw.githubusercontent.com/cloudxabide/eksa.matrix.lab/main/Files/etc_dhcp_dhcpd-hosts.conf | sudo tee /etc/dhcp/dhcpd-hosts.conf
systemctl restart isc-dhcp-server.service


journalctl -f -u isc-dhcp-server.service
