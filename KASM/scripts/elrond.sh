#!/bin/bash
sudo apt update
/opt/KASM/KASM/scripts/tools/./virtual.sh
sleep 1
sudo apt-get install mlocate dconf-tools virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
python3 -m pip install --upgrade pip
sudo git clone https://github.com/ezaspy/gandalf.git /opt/gandalf
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
sudo echo "sleep 1" > /opt/elrond/elrond/tools/config/scripts/finish.sh
sleep 1
sudo /opt/elrond/./make.sh
sudo updatedb
/opt/KASM/KASM/scripts/./user.sh
sudo reboot