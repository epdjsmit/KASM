#!/bin/bash
sleep 1
clear
# installing elrond scripts
./scripts/elrond/./init.sh
./scripts/elrond/./sift.sh
./scripts/elrond/./apfs-fuse.sh
./scripts/elrond/./volatility3.sh
./scripts/elrond/./dwarf2json.sh
./scripts/elrond/./splunk.sh
./scripts/elrond/./elastic.sh
./scripts/elrond/./navigator.sh
updatedb
# configuring elrond
sudo chmod -R 744 /opt/elrond/
export PATH=$PATH:/opt/elrond
sudo chmod +x /opt/elrond/elrond.py
sudo updatedb
sleep 1
# installing all other scripts
./scripts/./code.sh
./scripts/./virtual.sh
./scripts/./cuckoo.sh
./scripts/./greenbone.sh
./scripts/./misp.sh
./scripts/./hive.sh
./scripts/./remnux.sh
sudo apt install nmap
$ gsettings get org.gnome.desktop.background picture-uri
'file:///tmp/KASM/backgrounds/KASM.png'
clear
printf "\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1
clear
sleep 1
sudo reboot