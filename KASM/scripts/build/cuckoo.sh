#!/bin/bash
sudo add-apt-repository universe
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
pip2 install virtualenv
sudo apt update
sudo apt-get install python-dev-is-python2 python3-virtualenv python-setuptools install virtualbox-6.0 postgresql-contrib mongodb supervisord genisoimage qemu-system-x86 qemu-utils qemu-system-common -y --fix-missing
sudo adduser --disabled-password --gecos "" cuckoo
sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
#wget https://cuckoo.sh/win7ultimate.iso
sudo mkdir /mnt/win7
sudo mount -o ro,loop win7ultimate.iso /mnt/win7
#sudo apt-get update
#sudo apt-get install virtualbox-5.2
sudo usermod -a -G vboxusers cuckoo
sudo -H -u cuckoo bash -c 'virtualenv ~/cuckoo' 
sudo -H -u cuckoo bash -c '. ~/cuckoo/bin/activate' 
sudo -H -u cuckoo bash -c 'pip2 install vmcloak' 
sudo -H -u cuckoo bash -c 'vmcloak-vboxnet0'
sudo -H -u cuckoo bash -c 'vmcloak init --verbose --win7x64 win7x64base --cpus 2 --ramsize 2048'
sudo -H -u cuckoo bash -c 'vmcloak clone win7x64base win7x64cuckoo'
sudo -H -u cuckoo bash -c 'vmcloak list deps'
sudo -H -u cuckoo bash -c 'vmcloak install win7x64cuckoo adobepdf pillow dotnet java flash vcredist vcredist.version=2015u3 wallpaper' # additional packages are available
sudo -H -u cuckoo bash -c 'vmcloak install win7x64cuckoo ie11'
sudo -H -u cuckoo bash -c 'vmcloak install win7x64cuckoo office office.version=2007 office.isopath=/path/to/office2007.iso office.serialkey=XXXXX-XXXXX-XXXXX-XXXXX-XXXXX'
sudo -H -u cuckoo bash -c 'vmcloak snapshot --count 4 win7x64cuckoo 192.168.56.101'
sudo -H -u cuckoo bash -c 'vmcloak list vms'
############################
# Configuring Cuckoo
cuckoo init
cuckoo --cwd /tmp/cuckoo init
pip install psycopg2
sudo -u postgres psql
CREATE DATABASE cuckoo;
CREATE USER cuckoo WITH ENCRYPTED PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE cuckoo TO cuckoo;
\q
# $CWD/conf/cuckoo.conf
#  [database]
#  connection = postgresql://cuckoo:password@localhost/cuckoo
# $CWD/conf/virtualbox.conf
#  machines = cuckoo1 - remove this line
#  while read -r vm ip; do cuckoo machine --add $vm $ip; done < <(vmcloak list vms)
#  cuckoo community --force
sudo sysctl -w net.ipv4.conf.vboxnet0.forwarding=1
sudo sysctl -w net.ipv4.conf.eth0.forwarding=1
sudo iptables -t nat -A POSTROUTING -o eth0 -s 192.168.56.0/24 -j MASQUERADE
sudo iptables -P FORWARD DROP
sudo iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -s 192.168.56.0/24 -j ACCEPT
# $CWD/conf/reporting.conf
#  [MongoDB]
#  enabled = yes
cuckoo web --host 127.0.0.1 --port 8080
############################
# Starting Cuckoo
cuckoo --debug
#  OR
supervisord -c /home/cuckoo/.cuckoo/supervisord.conf
supervisorctl start cuckoo:
supervisorctl stop cuckoo: