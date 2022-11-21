#!/bin/bash
sleep 1
# thehive
sudo apt-get install ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run -d=true --rm -p 9000:9000 strangebee/thehive:latest
# misp
sleep 1
wget -O /tmp/INSTALL.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
sudo chown ninja:ninja /tmp/INSTALL.sh
sleep 1
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp
sudo usermod -aG sudo misp
sudo -H -u misp bash -c 'bash /tmp/INSTALL.sh -A'
sleep 1
sudo ufw allow 80/tcp > /dev/null 2>&1
sudo ufw allow 443/tcp > /dev/null 2>&1
printf "\n\n  -> Have you made a note of the MISP Credentials above? - MISP; DB; Local User. When ready, press ENTER to continue..."
read answer