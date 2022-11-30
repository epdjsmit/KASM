#!/bin/bash
sleep 1
clear
printf "\n\n  -> Initialising KASM...\n\n"
# removing uneeded applications
du -sh /var/cache/apt/archives
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* aisleriot gnome-mines gnome-sudoku gnome-mahjongg -y
sudo apt-get autoremove --purge
sudo apt-get clean
# initialising kasm
sleep 1
python3 -m keyring --disable
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.session idle-delay 0
sudo chmod -R 755 /opt/kasm
/opt/kasm/kasm/build/install/./repos.sh
python3 -m pip install --upgrade pip
python2.7 -m pip install --upgrade pip
# preparing elastic
wget -O elastic.py "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083290&authkey=ADWrcfFoW6cbo2M"
sudo mv elastic.py /opt/kasm/kasm/build/install/
# preparing cuckoo
wget -O agent.pyw "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083287&authkey=AO9ecFMM8pXll1E"
sudo mv agent.pyw /opt/kasm/kasm/build/install/
# initialising elrond
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond
sleep 4
sudo sed -i '26d' /opt/elrond/elrond/config.sh
# preparing navigator
sudo cp /opt/elrond/elrond/rivendell/post/mitre/nav_json.py /opt/kasm/kasm/build/install/nav_json.py
sleep 2
sudo /opt/elrond/./make.sh
sudo updatedb
sleep 2
# initialising temp account
/opt/kasm/kasm/build/./temp.sh