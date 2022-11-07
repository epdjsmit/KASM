#!/bin/bash
sleep 1
wget -O /tmp/INSTALL.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh && sudo chown sansforensics:sansforensics /tmp/INSTALL.sh && sleep 1
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp && sudo usermod -aG sudo misp && sleep 1
sudo -H -u misp bash -c 'bash /tmp/INSTALL.sh -A' && sleep 1
printf "\n\n  -> Have you made a note of the MISP Credentials above? - MISP; DB and Local User. When ready, press ENTER to continue..."
read answer
exit && sleep 1 && sudo ufw allow 80/tcp
sleep 1 && sudo ufw allow 443/tcp