#!/bin/bash
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
rm -rf /opt/elrond/elrond/config.sh
echo "sleep 1" > /opt/elrond/elrond/config.sh
sudo /opt/elrond/./make.sh