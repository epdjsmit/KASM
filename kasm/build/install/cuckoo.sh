#!/bin/bash
#https://github.com/cyberthint/cuckoo-sandbox-installation-script
clear
sleep 1
printf "\n\n  -> Installing Cuckoo...\n\n"
sleep 1
wget -O cuckoo-setup.zip https://github.com/cyberthint/cuckoo-sandbox-installation-script/archive/refs/heads/master.zip && unzip cuckoo-setup.zip && cd cuckoo-sandbox-installation-script-master && sed -i '6d' run-as-root.sh && chmod a+x run-as-root.sh
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
python get-pip.py
sudo apt-get update
sudo apt install software-properties-common build-essential python python-dev libffi-dev libssl-dev python-setuptools libjpeg-dev zlib1g-dev swig libpq-dev tcpdump genisoimage apt-transport-https ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io -y
pip2 install virtualenv
sudo adduser --disabled-password --gecos "" cuckoo
sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
sudo apt install apparmor-utils -y
sudo aa-disable /usr/sbin/tcpdump
sudo cp ./run-as-cuckoo.sh /home/cuckoo/run-as-cuckoo.sh
sudo chown cuckoo:cuckoo /home/cuckoo/run-as-cuckoo.sh
sudo chmod a+x /home/cuckoo/run-as-cuckoo.sh
sudo cp ./services/start-cuckoo.sh /home/cuckoo/start-cuckoo.sh
sudo chown cuckoo:cuckoo /home/cuckoo/start-cuckoo.sh
sudo chmod a+x /home/cuckoo/start-cuckoo.sh
sudo cp -R ./conf /home/cuckoo/conf
sudo chown -R cuckoo:cuckoo /home/cuckoo/conf
#wget --no-check-certificate -O win10.iso "https://onedrive.live.com/download?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213079389&authkey=ACz-4e4PU0wPT5E"
mkdir -p /mnt/cuckoo/win10
#sudo mount -o ro,loop win10.iso /mnt/cuckoo/win10
sudo mount -o ro,loop /mnt/hgfs/kasm/TEST/Windows10.iso /mnt/cuckoo/win10
sudo apt install virtualbox-6.0 -y
sudo usermod -a -G vboxusers cuckoo
vboxmanage hostonlyif create
echo 1 | sudo tee -a /proc/sys/net/ipv4/ip_forward
sudo sysctl -w net.ipv4.ip_forward=1
sudo cp ./docker-compose.yml /start-cuckoo-services.yml
sudo cp ./services/cuckoo-docker.service /etc/systemd/system/cuckoo-docker.service
sudo systemctl enable cuckoo-docker.service
sudo cp ./services/cuckoo-settings.service /etc/systemd/system/cuckoo-settings.service
sudo systemctl enable cuckoo-settings.service
sudo cp ./services/cuckoo.service /etc/systemd/system/cuckoo.service
sudo systemctl enable cuckoo.service
sudo cp ./services/cuckoo-web.service /etc/systemd/system/cuckoo-web.service
sudo systemctl enable cuckoo-web.service
sudo cp ./services/cuckoo-api.service /etc/systemd/system/cuckoo-api.service
sudo systemctl enable cuckoo-api.service

#$ su - cuckoo
#$ cd ~
#$ ./run-as-cuckoo.sh
# sudo -H -u cuckoo bash -c '/home/cuckoo/./run-as-cuckoo.sh'

#$ source /home/cuckoo/cuckoo/bin/activate
#$ cuckoo
