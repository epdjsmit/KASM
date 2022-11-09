#!/bin/bash
# vmware
sudo tar -xvf /opt/elrond/elrond/tools/config/VMwareTools-10.3.23-16594550.tar.gz
sleep 1
cd vmware-tools-distrib
sudo rm -rf vmware-install.pl
sudo cp /opt/elrond/elrond/tools/config/vmware-install.pl .
sudo chmod 755 vmware-install.pl
yes '' | sudo ./vmware-install.pl -f
cd ..
sudo rm -rf vmware-tools-distrib
# virtualbox
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections