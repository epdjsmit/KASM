#!/bin/bash
sleep 1
clear
# installing and configuring elrond
sudo ./scripts/.elrond.sh
updatedb
sudo chmod -R 744 /opt/elrond/
export PATH=$PATH:/opt/elrond
sudo chmod +x /opt/elrond/elrond.py
sudo updatedb
sleep 1
# installing all other scripts
sudo ./scripts/./code.sh
sudo ./scripts/./virtual.sh
sudo ./scripts/./cuckoo.sh
sudo ./scripts/./greenbone.sh
sudo ./scripts/./misp.sh
sudo ./scripts/./hive.sh
sudo ./scripts/./remnux.sh
sudo apt install nmap
gsettings get org.gnome.desktop.background picture-uri
'file:///tmp/KASM/images/KASM.png'
clear
printf "\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1
clear
sleep 1
sudo reboot