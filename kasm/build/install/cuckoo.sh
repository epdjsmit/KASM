#!/bin/bash
#https://tech-zealots.com/malware-analysis/cuckoo-sandbox-host-installation-part-1/
clear
sleep 1
printf "\n\n  -> Installing Cuckoo...\n\n"
sleep 1
# installing components
sudo apt-get install libmysqlclient20 libffi-dev libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev python-setuptools libjpeg-dev zlib1g-dev libxml2-dev libxslt1-dev libevent-dev libpcre3 libpcre3-dev libtool libpcre++-dev g++ automake dkms unzip wget python-sqlalchemy python-jinja2 python-magic python-mysqldb python-chardet mongodb postgresql libpq-dev tcpdump libcap2-bin apparmor-utils ssdeep python-pyrex subversion libfuzzy-dev swig vsftpd libjansson-dev libmagic-dev libtool-bin ./python-mysqldb_1.3.10-1build1_amd64.deb -y
pip2 install virtualenv bson dpkt gridfs-fuse bottle cybox==2.0.1.4 maec "Django<2" m2crypto==0.31.0 IPython==5.0 jupyter openpyxl ujson
sudo -H pip2 install ansible --upgrade
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
getcap /usr/sbin/tcpdump
wget -O distorm-3.4.1.tar.gz https://github.com/gdabah/distorm/archive/refs/tags/v3.4.1.tar.gz
wget -O yara-3.8.1.tar.gz https://github.com/VirusTotal/yara/archive/refs/tags/v3.8.1.tar.gz
tar -zxvf distorm-3.4.1.tar.gz
cd distorm-3.4.1
sudo python2.7 setup.py install
cd ..
sudo tar -zxvf yara-3.8.1.tar.gz
cd yara-3.8.1
sudo ./bootstrap.sh
sudo ./configure --with-crypto --enable-magic --enable-cuckoo
sudo make
sudo make install
sudo -H pip2 install yara-python
cd ..
sudo rm -rf python-mysqldb_1.3.10-1build1_amd64.deb
sudo rm -rf distorm-3.4.1
sudo rm -rf distorm-3.4.1.tar.gz
sudo rm -rf build.sh
sudo rm -rf yara-3.8.1
sudo rm -rf yara-3.8.1.tar.gz
# configuring ftp server
sudo cat /etc/vsftpd.conf > vsftpd.conf.bak
sudo mv vsftpd.conf.bak /etc/
sudo chmod 644 /etc/vsftpd.conf.bak
sudo sed -i '14s/listen=NO/listen=YES/' /etc/vsftpd.conf
sudo sed -i '22s/listen_ipv6=YES/listen_ipv6=NO/' /etc/vsftpd.conf
sudo sed -i '25s/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd.conf
sudo sed -i '31s/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sudo sed -i '44s/#anon_upload_enable=YES/anon_upload_enable=YES/' /etc/vsftpd.conf
sudo sed -i '44s/#anon_mkdir_write_enable=YES/anon_mkdir_write_enable=YES/' /etc/vsftpd.conf
sudo service vsftpd restart
# creating cuckoo user
sudo useradd -m -u 6478 -p $(openssl passwd -1 cuckoo) cuckoo && sudo usermod -aG sudo cuckoo
sleep 1
sudo groupadd libvirt
sudo groupadd pcap
sudo usermod -L cuckoo
sudo usermod -a -G kvm cuckoo
sudo usermod -a -G libvirt cuckoo
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
sudo mkdir -p /home/cuckoo/vmshared/pub
sudo chmod -R ug=rwX,o=rX /home/cuckoo/vmshared/
sudo chmod -R ugo=rwX /home/cuckoo/vmshared/pub