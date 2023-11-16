#!/bin/bash


SUDO_USER=mansible
echo "Note:  you are going to be asked the login password for $SUDO_USER"
echo "$SUDO_USER ALL=(ALL) NOPASSWD: ALL" | sudo tee  /etc/sudoers.d/$SUDO_USER-nopasswd-all

sudo apt upgrade -y
sudo apt update -y
