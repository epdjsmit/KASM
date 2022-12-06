#!/bin/bash
# thehive
printf "      >> Installing TheHive\n"
sudo adduser --system docker
sudo groupadd docker
sudo usermod -aG docker docker
sudo apt-get install ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin dbus-user-session -y
sudo docker run -d=true --rm -p 9000:9000 strangebee/thehive:latest
sudo rm /etc/apt/sources.list.d/docker.list
printf "       -> Done\n"

# misp
printf "      >> Installing MISP\n"
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp && sudo usermod -aG sudo misp
wget -O /tmp/INSTALL_orig.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh
sudo chmod +x /tmp/INSTALL_orig.sh
sudo python3 /opt/kasm/kasm/build/install/./misp.py
sudo chmod 777 /tmp/INSTALL.sh
#sudo dpkg --configure -a
#sudo apt install --reinstall python3-six
#sudo apt install --reinstall python3-chardet
#pip install pytz
bash /tmp/INSTALL.sh -c -M -u
sudo rm /tmp/INSTALL.sh
sudo ufw allow 80/tcp > /dev/null 2>&1
sudo ufw allow 443/tcp > /dev/null 2>&1
printf "       -> Done\n"