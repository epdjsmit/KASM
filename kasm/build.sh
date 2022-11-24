#!/bin/bash
clear
sleep 1
sudo userdel temp && sudo rm -rf /home/temp
sudo apt install code
/opt/kasm/kasm/build/install/./gvm.sh
/opt/kasm/kasm/build/install/./thp.sh
/opt/kasm/kasm/build/install/./remnux.sh
#/opt/kasm/kasm/build/install/./cuckoo.sh # dev
/opt/kasm/kasm/build/install/./tools.sh
/opt/kasm/kasm/build/./ninja.sh