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
sudo rm /etc/apt/sources.list.d/docker.list
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root
sleep 10
# misp
clear
sleep 1
printf "\n\n  -> Configuring MISP...\n"
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp && sudo usermod -aG sudo misp
sleep 4
wget -O /tmp/INSTALL_orig.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
sudo chmod +x /tmp/INSTALL_orig.sh
sudo python3 /opt/kasm/kasm/build/install/./misp.py
sudo chmod 777 /tmp/INSTALL.sh
bash /tmp/INSTALL.sh -A
sleep 4
sudo rm /tmp/INSTALL.sh
sudo ufw allow 80/tcp > /dev/null 2>&1
sudo ufw allow 443/tcp > /dev/null 2>&1
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root
sleep 10