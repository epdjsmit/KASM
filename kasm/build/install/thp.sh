#!/bin/bash
# thehive
clear
sleep 1
printf "\n\n  -> Configuring TheHive...\n\n"
sleep 1
sudo adduser --system docker
sudo groupadd docker
sudo usermod -aG docker docker
sudo apt-get install ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin dbus-user-session -y
sudo docker run -d=true --rm -p 9000:9000 strangebee/thehive:latest
sudo rm etc/apt/sources.list.d/docker.list
## misp
clear
sleep 1
printf "\n\n  -> Configuring MISP...\n"
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp && sudo usermod -aG sudo misp
sleep 1
wget -O /tmp/INSTALL_orig.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
sudo chown ninja:ninja /tmp/INSTALL_orig.sh
python3 /opt/kasm/kasm/build/install/./misp.py
sudo -H -u misp bash -c 'bash /tmp/INSTALL.sh -A'
sleep 1
sudo ufw allow 80/tcp > /dev/null 2>&1
sudo ufw allow 443/tcp > /dev/null 2>&1