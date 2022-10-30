#!/bin/bash
sleep 1
clear
# installing and configuring elrond
sudo /tmp/KASM/KASM/scripts/./elrond.sh
updatedb
sudo chmod -R 744 /opt/elrond/
export PATH=$PATH:/opt/elrond
sudo chmod +x /opt/elrond/elrond.py
sudo updatedb
sleep 1
# installing all other scripts
sudo /tmp/KASM/KASM/scripts/./code.sh
sudo /tmp/KASM/KASM/scripts/./virtual.sh
sudo /tmp/KASM/KASM/scripts/./cuckoo.sh
sudo /tmp/KASM/KASM/scripts/./greenbone.sh
sudo /tmp/KASM/KASM/scripts/./misp.sh
sudo /tmp/KASM/KASM/scripts/./hive.sh
sudo /tmp/KASM/KASM/scripts/./remnux.sh
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