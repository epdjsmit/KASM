#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring Cuckoo...\n\n"
sleep 1
sudo virtualenv venv
. venv/bin/activate
pip2 install -U setuptools cuckoo
/home/ninja/.local/bin/cuckoo -d
sudo cp /opt/kasm/kasm/build/config/agent.pyw /home/cuckoo/vmshared/
sudo systemctl enable mongodb.service
sudo service mongodb start
sed -i '45s/enabled = no/enabled = yes/' /home/ninja/.cuckoo/conf/reporting.conf
sed -i '10s/= no/= yes/' /home/ninja/.cuckoo/conf/cuckoo.conf
sudo service mongodb restart
deactivate