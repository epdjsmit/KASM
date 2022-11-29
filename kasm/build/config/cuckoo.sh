#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring Cuckoo...\n\n"
sleep 1
sudo virtualenv venv
. venv/bin/activate
pip2 install -U setuptools cuckoo
#/home/ninja/.local/bin/cuckoo -d
sudo cp /opt/kasm/kasm/build/config/agent.pyw /home/cuckoo/vmshared/
sudo systemctl enable mongodb.service
sudo service mongodb start
sudo rm -rf /home/ninja/.cuckoo/conf/reporting.conf
sudo mv /mnt/hgfs/kasm/TEST/reporting.conf /home/ninja/.cuckoo/conf/reporting.conf
#sudo mv reporting.conf /home/ninja/.cuckoo/conf/reporting.conf
sudo service mongodb restart
/home/ninja/.local/bin/cuckoo web runserver
deactivate
