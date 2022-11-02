#!/bin/bash
sleep 1
clear
/tmp/KASM/KASM/scripts/./init.sh
/tmp/KASM/KASM/scripts/./code.sh
#/tmp/KASM/KASM/scripts/./greenbone.sh
##/tmp/KASM/KASM/scripts/./cuckoo.sh
#/tmp/KASM/KASM/scripts/./remnux.sh
##/tmp/KASM/KASM/scripts/./hive.sh
#/tmp/KASM/KASM/scripts/./misp.sh
sleep 1
hostnamectl set-hostname KASM
sudo useradd -m KASM
sudo passwd KASM
sleep 1
mv /home/sansforensics/Desktop/Posters /home/KASM/Desktop/
gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/background.png'
printf "\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1 && clear && sleep 1
sudo reboot

# yes '' | sudo ./vmware-install.pl -f