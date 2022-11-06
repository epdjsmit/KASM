#!/bin/bash
yes '' | sudo add-apt-repository ppa:mrazavi/gvm && clear && sudo apt update
/tmp/KASM/KASM/scripts/./virtualbox.sh && sleep 1
sudo apt-get install mlocate dconf2 virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
python3 -m pip install --upgrade pip
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
rm -rf /opt/elrond/elrond/tools/config/scripts/finish.sh && sleep 1
echo "sleep 1" > /opt/elrond/elrond/tools/config/scripts/finish.sh
sudo /opt/elrond/./make.sh


#  - Configuring virtualbox-ext-pack<br>
#    - **TAB**<br>
#    - **&lt;Ok&gt;**<br>
#    - Do you accept the terms of the VirtualBox PUEL license?<br>
#      - **TAB**<br>
#      - **&lt;Yes&gt;**<br><br>

#sudo apt install postgresql

#sudo add-apt-repository ppa:mrazavi/gvm
#sudo apt install gvm

#sudo -u gvm -g gvm greenbone-nvt-sync
#sudo -u gvm -g gvm greenbone-feed-sync --type CERT
#sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
#sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA

#export $(sudo cat /etc/default/gvmd-pg)
#sudo -E -u gvm -g gvm gvmd --rebuild

#http://localhost:9392

# gsettings get org.gnome.shell favorite-apps