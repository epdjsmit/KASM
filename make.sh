#!/bin/bash
sudo chmod +x /opt/KASM/KASM/config.sh
sudo chmod +x /opt/KASM/KASM/scripts/*.sh
sudo chmod +x /opt/KASM/KASM/scripts/tools/*.sh
python3 -m keyring --disable
/opt/KASM/KASM/scripts/./elrond.sh