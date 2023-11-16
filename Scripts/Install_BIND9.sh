#!/bin/bash

NEEDRESTART_MODE=a

sudo apt install -y bind9 bind9utils bind9-doc
sudo sed -i -e 's/bind/bind -4/g' /etc/default/named

sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.bak
curl https://raw.githubusercontent.com/cloudxabide/eksa.matrix.lab/main/Files/etc_bind_named.conf.options | sudo tee /etc/bind/named.conf.options
sudo systemctl restart bind9  # You now have a caching nameserver using Google DNS as forwarders
 
sudo mkdir -p /chroot/named
cd /chroot/named
sudo mkdir -p dev etc/namedb/slave var/run



named-checkzone eksa.matrix.lab /etc/bind/db.eksa.matrix.lab







references() {
echo "https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-22-04"

echo "Who knows how old this is?  https://help.ubuntu.com/community/BIND9ServerHowto"
}
