#!/bin/bash
sleep 1
wget -O /tmp/INSTALL.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
bash /tmp/INSTALL.sh -A
printf "\n\n  -> Have you made a note of the MISP Credentials above? - MISP; DB and Local User. When ready, press ENTER to continue..."
read answer
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sleep 1
