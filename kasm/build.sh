#!/bin/bash
clear
sleep 1
sudo userdel temp && sudo rm -rf /home/temp
/opt/kasm/kasm/build/install/./gvm.sh
sync; echo 1 > /proc/sys/vm/drop_caches
sleep 4
/opt/kasm/kasm/build/install/./thp.sh
sync; echo 1 > /proc/sys/vm/drop_caches
sleep 4
/opt/kasm/kasm/build/install/./remnux.sh
sync; echo 1 > /proc/sys/vm/drop_caches
sleep 4
/opt/kasm/kasm/build/install/./cuckoo.sh #dev
sync; echo 1 > /proc/sys/vm/drop_caches
sleep 4
/opt/kasm/kasm/build/install/./tools.sh
sync; echo 1 > /proc/sys/vm/drop_caches
sleep 4
/opt/kasm/kasm/build/./ninja.sh