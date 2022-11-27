#!/bin/bash
clear
sleep 1
sudo userdel temp && sudo rm -rf /home/temp

/opt/kasm/kasm/build/install/./gvm.sh
sleep 4 && sync; echo 1 > /proc/sys/vm/drop_caches && sleep 4

/opt/kasm/kasm/build/install/./thp.sh
sleep 4 && sync; echo 1 > /proc/sys/vm/drop_caches && sleep 4

/opt/kasm/kasm/build/install/./remnux.sh
sleep 4 && sync; echo 1 > /proc/sys/vm/drop_caches && sleep 4

/opt/kasm/kasm/build/install/./cuckoo.sh #dev
sleep 4 && sync; echo 1 > /proc/sys/vm/drop_caches && sleep 4

/opt/kasm/kasm/build/install/./tools.sh
sleep 4 && sync; echo 1 > /proc/sys/vm/drop_caches && sleep 4

/opt/kasm/kasm/./config.sh
sleep 4 && sync; echo 1 > /proc/sys/vm/drop_caches && sleep 4

/opt/kasm/kasm/build/./ninja.sh