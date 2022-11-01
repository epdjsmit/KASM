#!/bin/bash
sleep 1
wget -O /tmp/INSTALL.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
bash /tmp/INSTALL.sh -A
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sleep 1