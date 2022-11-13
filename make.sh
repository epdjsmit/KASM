#!/bin/bash
sudo chmod +x /opt/KASM/KASM/*.sh
sudo chmod +x /opt/KASM/KASM/scripts/*.*
sudo chmod +x /opt/KASM/KASM/scripts/build/*.*
sudo chmod +x /opt/KASM/KASM/scripts/config/*.*
python3 -m keyring --disable
/opt/KASM/KASM/./build.sh
/opt/KASM/KASM/./config.sh