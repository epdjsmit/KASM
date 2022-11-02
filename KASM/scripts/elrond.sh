#!/bin/bash
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
rm -rf /opt/elrond/elrond/tools/config/scripts/finish.sh
sleep 1
echo "sleep 1" > /opt/elrond/elrond/tools/config/scripts/finish.sh
sudo /opt/elrond/./make.sh
