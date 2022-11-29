#!/bin/bash
sleep 1
clear
printf "\n\n  -> Initialising KASM...\n\n"
# removing uneeded applications
du -sh /var/cache/apt/archives
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* aisleriot gnome-mines gnome-sudoku gnome-mahjongg -y
sudo apt-get autoremove --purge
sudo apt-get clean
# initialising kasm
sleep 1
sudo chmod -R 755 /opt/kasm
/opt/kasm/kasm/build/install/./repos.sh
python3 -m pip install --upgrade pip
python2.7 -m pip install --upgrade pip
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
sed -i '26d' /opt/elrond/elrond/config.sh
sudo /opt/elrond/./make.sh
sudo updatedb
sleep 2
/opt/kasm/kasm/build/./temp.sh