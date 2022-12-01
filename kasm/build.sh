#!/bin/bash
clear
sleep 10
sudo userdel temp && sudo rm -rf /home/temp
#sleep 10000000
#options=$(cat /home/ninja/.vars)
#echo $options

/opt/kasm/kasm/build/install/./thp.sh # testing
/opt/kasm/kasm/build/install/./gvm.sh # untested
/opt/kasm/kasm/build/install/./cuckoo.sh # untested
/opt/kasm/kasm/build/install/./remnux.sh # untested
/opt/kasm/kasm/build/install/./tools.sh # untested

/opt/kasm/kasm/./config.sh # untested
/opt/kasm/kasm/build/./ninja.sh # untested