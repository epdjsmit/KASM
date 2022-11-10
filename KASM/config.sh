#!/bin/bash
sudo userdel temp && sudo rm -rf /home/temp
/opt/KASM/KASM/scripts/tools/./code.sh
/opt/KASM/KASM/scripts/tools/./gvm.sh
/opt/KASM/KASM/scripts/tools/./misp.sh
/opt/KASM/KASM/scripts/tools/./remnux.sh
#/opt/KASM/KASM/scripts/tools/./cuckoo.sh
#/opt/KASM/KASM/scripts/tools/./hive.sh
/opt/KASM/KASM/scripts/./bashrc.sh