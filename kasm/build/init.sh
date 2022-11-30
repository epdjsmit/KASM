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
# configuring repositories
sudo apt update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg # thehive
yes '' | echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # thehive / cuckoo
yes '' | sudo add-apt-repository ppa:mrazavi/gvm # greenbone
echo 'deb http://security.ubuntu.com/ubuntu xenial-security main' | sudo tee /etc/apt/sources.list.d/xenial-security.list # cuckoo
wget -c http://archive.ubuntu.com/ubuntu/pool/main/p/python-mysqldb/python-mysqldb_1.3.10-1build1_amd64.deb # cuckoo
yes '' | sudo add-apt-repository ppa:micahflee/ppa # tor
sudo apt update
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root
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