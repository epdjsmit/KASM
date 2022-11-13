#!/bin/bash
sudo chmod +x /opt/KASM/KASM/build.sh
sudo chmod +x /opt/KASM/KASM/scripts/build/*.sh
sudo chmod +x /opt/KASM/KASM/scripts/build/tools/*.sh
sudo chmod +x /opt/KASM/KASM/scripts/config/*.sh
sudo chmod +x /opt/KASM/KASM/scripts/config/tools/*.sh
python3 -m keyring --disable
/opt/KASM/KASM/scripts/./build.sh
/opt/KASM/KASM/scripts/./config.sh