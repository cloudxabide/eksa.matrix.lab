#!/bin/bash

#  Status: Complete/Done
# Purpose:

# Allow sudo NOPASSWD
SUDO_USER=mansible
echo "Note:  you are going to be asked the login password for $SUDO_USER"
echo "$SUDO_USER ALL=(ALL) NOPASSWD: ALL" | sudo tee  /etc/sudoers.d/$SUDO_USER-nopasswd-all

# Update the system
sudo apt upgrade -y
sudo apt update -y

# Unload problematic module at reboot via cron
CRON_UPDATE="@reboot modprobe -r tps6598x"
(crontab -l; echo "$CRON_UPDATE") | crontab -

# Update SSH 
[ ! -f ~/.ssh/id_ecdsa ] && { echo | ssh-keygen -C "Default Host SSH Key" -f ~/.ssh/id_ecdsa -tecdsa -b521 -N ''; } 
[ ! -f ~/.ssh/id_ecdsa-lab ] && { echo | ssh-keygen -C "Lab Host SSH Key" -f ~/.ssh/id_ecdsa-lab -tecdsa -b521 -N ''; } 
cat << EOF > ~/.ssh/config 
Host *.eksa.matrix.lab
  User mansible
  UserKnownHostsFile ~/.ssh/known_hosts.eksa.matrix.lab
  IdentityFile ~/.ssh/id_ecdsa-lab
EOF
chmod 0600 ~/.ssh/config

exit 0
