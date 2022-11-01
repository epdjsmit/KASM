#!/bin/bash
sleep 1
clear
sudo apt update
yes '' | sudo add-apt-repository ppa:mrazavi/gvm
sudo apt-get install virtualbox virtualbox-ext-pack virtualbox-qt net-tools postgresql gvm nmap -y --fix-missing
sudo apt install gnupg software-properties-common apt-transport-https wget -y --fix-missing
sudo apt update
sudo python3 -m pip install --upgrade pip
# installing and configuring elrond
sudo /tmp/KASM/KASM/scripts/./elrond.sh
# installing all other scripts
printf "\n\n  -> KASM will install the remaining software automaically. Press ENTER to continue..."
read answer
sudo /tmp/KASM/KASM/scripts/./code.sh
sudo /tmp/KASM/KASM/scripts/./greenbone.sh
#sudo /tmp/KASM/KASM/scripts/./cuckoo.sh
sudo /tmp/KASM/KASM/scripts/./remnux.sh
#sudo /tmp/KASM/KASM/scripts/./hive.sh
sudo /tmp/KASM/KASM/scripts/./misp.sh
gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/background.png'
sleep 1
clear
printf "\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1 && clear && sleep 1
sudo reboot

# yes '' | sudo ./vmware-install.pl -f
# wget https://REMnux.org/remnux-cli && mv remnux-cli remnux && chmod +x remnux && sudo mv remnux /usr/local/bin && sudo remnux install