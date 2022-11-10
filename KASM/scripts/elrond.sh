#!/bin/bash
sudo apt update
/opt/KASM/KASM/scripts/tools/./virtual.sh
sleep 1
sudo apt-get install mlocate dconf-tools virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
python3 -m pip install --upgrade pip
sudo git clone https://github.com/ezaspy/gandalf.git /opt/gandalf
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
sudo chmod -R 744 /opt/elrond/
sudo rm -rf /opt/elrond/elrond/config.sh
echo '#!/bin/bash
sleep 1
clear
cd /opt/elrond/elrond
/opt/elrond/elrond/tools/config/scripts/./init.sh
/opt/elrond/elrond/tools/config/scripts/./pwsh.sh
/opt/elrond/elrond/tools/config/scripts/./apfs-fuse.sh
/opt/elrond/elrond/tools/config/scripts/./volatility3.sh
/opt/elrond/elrond/tools/config/scripts/./dwarf2json.sh
/opt/elrond/elrond/tools/config/scripts/./splunk.sh
/opt/elrond/elrond/tools/config/scripts/./elastic.sh
/opt/elrond/elrond/tools/config/scripts/./navigator.sh
#/opt/elrond/elrond/tools/config/scripts/./nsrl.sh
sudo chmod -R 744 /opt/elrond/ && sudo chmod +x /opt/elrond/elrond/elrond.py
echo "export PATH=$PATH:/opt/elrond" >> /home/sansforensics/.bashrc
sudo updatedb
sleep 1' > /opt/elrond/elrond/config.sh
sleep 1000
sudo /opt/elrond/./make.sh
sudo updatedb
/opt/KASM/KASM/scripts/./user.sh
sudo reboot