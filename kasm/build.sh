#!/bin/bash
clear
sleep 1
sudo userdel temp && sudo rm -rf /home/temp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo rm -rf google-chrome-stable_current_amd64.deb
sudo snap install opera
sudo apt install torbrowser-launcher -y
sudo apt install code -y
/opt/kasm/kasm/build/install/./gvm.sh
/opt/kasm/kasm/build/install/./thp.sh
/opt/kasm/kasm/build/install/./remnux.sh
#/opt/kasm/kasm/build/install/./cuckoo.sh # dev
/opt/kasm/kasm/build/install/./tools.sh
/opt/kasm/kasm/build/./ninja.sh