#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring Cuckoo...\n\n"
sleep 1

sudo cat /etc/vsftpd.conf > vsftpd.conf.bak
sudo rm -rf /etc/vsftpd.conf
python3 /opt/kasm/kasm/build/install/cuckoo.py
sudo cp vsftpd.conf /etc/
sudo chmod 644 /etc/vsftpd.conf
sudo service vsftpd restart
sudo mv run_cuckoo.sh /home/cuckoo/
sudo chmod +x /home/cuckoo/run_cuckoo.sh
sudo chown cuckoo:cuckoo /home/cuckoo/run_cuckoo.sh
sudo -H -u cuckoo bash -c '/home/cuckoo/./run_cuckoo.sh'
cuckoo web runserver
