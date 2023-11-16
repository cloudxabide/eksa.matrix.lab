#!/bin/bash

NEEDRESTART_MODE=a

sudo apt install -y bind9 bind9utils bind9-doc
sudo sed -i -e 's/bind/bind -4/g' /etc/default/named

sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.bak

 
sudo mkdir -p /chroot/named
cd /chroot/named
sudo mkdir -p dev etc/namedb/slave var/run



named-checkzone eksa.matrix.lab /etc/bind/db.eksa.matrix.lab







references() {
echo "https://help.ubuntu.com/community/BIND9ServerHowto"
}
