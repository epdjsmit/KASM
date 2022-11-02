#!/bin/bash
sleep 1
echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-5.2 tcpdump apparmor-utils libcap2-bin -y --fix-missing
sudo aa-disable /usr/sbin/tcpdump
sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
sudo pip install m2crypto==0.24.0
sudo adduser cuckoo
sudo usermod -a -G vboxusers cuckoo
mkdir /opt/cuckoo
chown cuckoo:cuckoo /opt/cuckoo
cuckoo --cwd /opt/cuckoo
export CUCKOO=/opt/cuckoo
sleep 1
