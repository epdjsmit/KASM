#!/bin/bash
yes '' | sudo add-apt-repository ppa:mrazavi/gvm
clear
sudo apt update
/tmp/KASM/KASM/scripts/./virtualbox.sh
sleep 1
sudo apt-get install mlocate dconf2 virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
python3 -m pip install --upgrade pip
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
rm -rf /opt/elrond/elrond/tools/config/scripts/finish.sh
sleep 1
echo "sleep 1" > /opt/elrond/elrond/tools/config/scripts/finish.sh
sudo /opt/elrond/./make.sh
/tmp/KASM/KASM/scripts/software/./code.sh
/tmp/KASM/KASM/scripts/software/./remnux.sh
/tmp/KASM/KASM/scripts/software/./misp.sh
#/tmp/KASM/KASM/scripts/software/./cuckoo.sh
#/tmp/KASM/KASM/scripts/software/./hive.sh