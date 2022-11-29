#!/bin/bash
sleep 1
clear
printf "\n\n  -> Initialising KASM...\n\n"
# removing uneeded applications
du -sh /var/cache/apt/archives
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* aisleriot gnome-mines gnome-sudoku gnome-mahjongg -y
sudo apt-get clean
sudo apt-get autoremove --purge
# initialising kasm
sleep 1
sudo chmod -R 755 /opt/kasm
sudo apt update
wget -O python.zip "https://onedrive.live.com/download?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083049&authkey=AFxFfe17EKJ0iL0"
unzip python.zip
sleep 100000
/opt/kasm/kasm/build/install/./repos.sh
sudo apt-get install mlocate dconf-tools net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
python3 -m pip install --upgrade pip
python2.7 -m pip install --upgrade pip
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
sudo rm -rf /opt/elrond/elrond/config.sh
sudo echo '#!/bin/bash
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
/opt/elrond/elrond/tools/config/scripts/./nsrl.sh
sudo chmod -R 744 /opt/elrond/ && sudo chmod +x /opt/elrond/elrond/elrond.py
echo "export PATH=$PATH:/opt/elrond" >> /home/sansforensics/.bashrc
sudo updatedb
sleep 1' > config.sh
chmod +x config.sh
sudo mv config.sh /opt/elrond/elrond/
sudo chmod -R 755 /opt/elrond/
sudo chown -R root:root /opt/elrond/
sudo /opt/elrond/./make.sh
sudo updatedb
sleep 2
/opt/kasm/kasm/build/./temp.sh