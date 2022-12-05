#!/bin/bash
sleep 2
clear
printf "\n\n  -> Initialising KASM...\n\n"

# initialising kasm
sudo chmod -R 755 /opt/kasm
python3 -m keyring --disable
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.session idle-delay 0

# creating cuckoo user
sudo useradd -m -u 6478 -p $(openssl passwd -1 cuckoo) cuckoo && sudo usermod -aG sudo cuckoo # > /dev/null 2>&1
printf "\n >> Please enter a password for the cuckoo account\n"
sudo passwd cuckoo

# remnux must be installed before anything else
printf "\n >> Downloading and installing REMnux\n"
wget https://REMnux.org/remnux-cli # > /dev/null 2>&1
mv remnux-cli remnux # > /dev/null 2>&1
chmod +x remnux # > /dev/null 2>&1
sudo mv remnux /usr/local/bin # > /dev/null 2>&1
sudo remnux install # > /dev/null 2>&1

# configuring repositories
printf "\n >> Updating repositories...\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg # > /dev/null 2>&1 # thehive
sleep 4
yes '' | echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # > /dev/null 2>&1 # thehive / cuckoo
sleep 4
yes '' | sudo add-apt-repository ppa:mrazavi/gvm # > /dev/null 2>&1 # greenbone
echo 'deb http://security.ubuntu.com/ubuntu xenial-security main' | sudo tee /etc/apt/sources.list.d/xenial-security.list # > /dev/null 2>&1 # cuckoo
wget -O /tmp/python-mysqldb_1.3.10-1build1_amd64.deb http://archive.ubuntu.com/ubuntu/pool/main/p/python-mysqldb/python-mysqldb_1.3.10-1build1_amd64.deb # > /dev/null 2>&1 # cuckoo
sleep 4
#yes '' | sudo add-apt-repository ppa:micahflee/ppa # > /dev/null 2>&1 # tor
sudo apt update # > /dev/null 2>&1
echo " >>  Repositories updated\n"

# installing kasm software suites
#options=$(cat /home/sansforensics/.vars)

# preparing cuckoo
printf "\n >>  Preparing cuckoo sandbox\n"
wget -O agent.pyw "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083287&authkey=AO9ecFMM8pXll1E" # > /dev/null 2>&1
sudo mv agent.pyw /opt/kasm/kasm/build/install/ # > /dev/null 2>&1
/opt/kasm/kasm/build/install/./cuckoo.sh
/opt/kasm/kasm/build/install/./thp.sh
/opt/kasm/kasm/build/install/./tools.sh # > /dev/null 2>&1
sudo apt install postgresql gvm libvirt-daemon -y --fix-missing
sudo -u gvm -g gvm greenbone-nvt-sync
sudo -u gvm -g gvm greenbone-feed-sync --type CERT
sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA
export $(sudo cat /etc/default/gvmd-pg)
sudo pg_ctlcluster 12 main start

# removing uneeded applications
printf "\n >> Removing unneeded software...\n"
sudo du -sh /var/cache/apt/archives # > /dev/null 2>&1
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* kdeconnect aisleriot gnome-mines gnome-sudoku gnome-mahjongg cheese ghex simple-scan wxhexeditor scite -y # > /dev/null 2>&1
sudo apt-get autoremove --purge # > /dev/null 2>&1
sudo apt-get clean # > /dev/null 2>&1
sudo chmod 777 /etc/sysctl.conf # > /dev/null 2>&1

# disabling updates via ipv6
sudo echo "

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
" >> /etc/sysctl.conf # > /dev/null 2>&1
sudo chmod 644 /etc/sysctl.conf # > /dev/null 2>&1
printf "\n >>  Uneeded software removed\n"
python3 -m pip install --upgrade pip # > /dev/null 2>&1
python2.7 -m pip install --upgrade pip # > /dev/null 2>&1

# preparing elastic
printf "\n >>  Preparing elastic stack\n"
wget -O elastic.py "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083290&authkey=ADWrcfFoW6cbo2M" # > /dev/null 2>&1
sudo mv elastic.py /opt/kasm/kasm/build/install/ # > /dev/null 2>&1

# installing virtualisation software
printf "\n >> Installing virtualisation software\n"
sudo wget https://download3.vmware.com/software/WKST-PLAYER-1624/VMware-Player-Full-16.2.4-20089737.x86_64.bundle # > /dev/null 2>&1
sudo chmod +x VMware-Player-Full-16.2.4-20089737.x86_64.bundle # > /dev/null 2>&1
sudo ./VMware-Player-Full-16.2.4-20089737.x86_64.bundle # > /dev/null 2>&1
sudo rm -rf VMware-Player-Full-16.2.4-20089737.x86_64.bundle # > /dev/null 2>&1
echo "sudo wget -O virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb https://download.virtualbox.org/virtualbox/7.0.2/virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb
sudo dpkg -i virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections" > virtualbox.sh # > /dev/null 2>&1
chmod +x virtualbox.sh # > /dev/null 2>&1
./virtualbox.sh # > /dev/null 2>&1
sudo rm -rf virtualbox.sh # > /dev/null 2>&1

# initialising elrond
printf "\n >> Initialising elrond\n"
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond # > /dev/null 2>&1
sudo chmod -R 777 /opt/elrond/elrond/config.sh # > /dev/null 2>&1
sudo sed -i '7d' /opt/elrond/elrond/config.sh # > /dev/null 2>&1
sudo sed -i '$ d' /opt/elrond/elrond/config.sh # > /dev/null 2>&1

# preparing navigator
sudo cp /opt/elrond/elrond/rivendell/post/mitre/nav_json.py /opt/kasm/kasm/build/install/nav_json.py # > /dev/null 2>&1

# installing elrond
sudo /opt/elrond/./make.sh # > /dev/null 2>&1
/opt/elrond/elrond/tools/config/scripts/./apfs-fuse.sh
sudo updatedb # > /dev/null 2>&1

# initialising temp account
/opt/kasm/kasm/build/./temp.sh