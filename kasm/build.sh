#!/bin/bash
clear
sleep 10
sudo userdel temp && sudo rm -rf /home/temp
#sleep 10000000
#options=$(cat /home/ninja/.vars)
#echo $options
/opt/kasm/kasm/build/install/./gvm.sh
/opt/kasm/kasm/build/install/./thp.sh
/opt/kasm/kasm/build/install/./remnux.sh
/opt/kasm/kasm/build/install/./cuckoo.sh
/opt/kasm/kasm/build/install/./tools.sh
/opt/kasm/kasm/./config.sh
/opt/kasm/kasm/build/./ninja.sh