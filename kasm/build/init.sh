#!/bin/bash
echo "


    ##########################################################
    ---- Commencing KASM-Workstation configuration script ----
    ##########################################################"
sleep 1
echo "    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ##########################################################
    |      Please note the following:                        |
    |          -> Configuring KASM takes ~10 hours           |
    |          -> Ensure you have BUILD.md to hand           |
    |          -> Select the options as instructed           |
    ##########################################################
"
sleep 1
# initialising kasm
printf "      >> Initialising KASM-Workstation\n"
sudo chmod -R 755 /opt/kasm
python3 -m keyring --disable
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.session idle-delay 0

# creating cuckoo user
printf "      >> Creating Cuckoo user\n"
sudo useradd -m -u 6478 -p $(openssl passwd -1 cuckoo) cuckoo && sudo usermod -aG sudo cuckoo > /dev/null 2>&1
sleep 1
sudo passwd cuckoo

# remnux must be installed before anything else
printf "\n      >> Installing REMnux\n"
wget https://REMnux.org/remnux-cli > /dev/null 2>&1
mv remnux-cli remnux
chmod +x remnux
sudo mv remnux /usr/local/bin
sudo remnux install > /dev/null 2>&1

# configuring repositories
printf "      >> Updating repositories\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg > /dev/null 2>&1 # thehive
sleep 4
yes '' | echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # thehive / cuckoo
sleep 4
yes '' | sudo add-apt-repository ppa:mrazavi/gvm > /dev/null 2>&1 # greenbone
echo 'deb http://security.ubuntu.com/ubuntu xenial-security main' | sudo tee /etc/apt/sources.list.d/xenial-security.list > /dev/null 2>&1 # cuckoo
wget -O /tmp/python-mysqldb_1.3.10-1build1_amd64.deb http://archive.ubuntu.com/ubuntu/pool/main/p/python-mysqldb/python-mysqldb_1.3.10-1build1_amd64.deb > /dev/null 2>&1 # cuckoo
sleep 4
#yes '' | sudo add-apt-repository ppa:micahflee/ppa > /dev/null 2>&1 # tor
sudo apt update > /dev/null 2>&1

# installing kasm software suites
#options=$(cat /home/sansforensics/.vars)

/opt/kasm/kasm/build/install/./cuckoo.sh > /dev/null 2>&1
/opt/kasm/kasm/build/install/./thp.sh > /dev/null 2>&1
printf "      >> Installing Additional Tools\n"
/opt/kasm/kasm/build/install/./tools.sh
printf "      >> Installing postgresql\n"
sudo apt install postgresql -y --fix-missing
printf "      >> Installing Greenbone Vulnerability Manager\n"
sudo apt install gvm -y --fix-missing
printf "      >> Installing libvirt-daemon\n"
sudo apt install libvirt-daemon -y --fix-missing
sudo -u gvm -g gvm greenbone-nvt-sync > /dev/null 2>&1
sudo -u gvm -g gvm greenbone-feed-sync --type CERT > /dev/null 2>&1
sudo -u gvm -g gvm greenbone-feed-sync --type SCAP > /dev/null 2>&1
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA > /dev/null 2>&1
export $(sudo cat /etc/default/gvmd-pg)
sudo pg_ctlcluster 12 main start > /dev/null 2>&1

# removing uneeded applications
printf "      >> Uninstalling redundant software\n"
sudo du -sh /var/cache/apt/archives > /dev/null 2>&1
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* kdeconnect aisleriot gnome-mines gnome-sudoku gnome-mahjongg cheese ghex simple-scan wxhexeditor scite -y > /dev/null 2>&1
sudo apt-get autoremove --purge > /dev/null 2>&1
sudo apt-get clean > /dev/null 2>&1

# disabling updates via ipv6
printf "      >> Disabling IPv6 Updates\n"
sudo chmod 777 /etc/sysctl.conf
sudo echo "

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
" >> /etc/sysctl.conf
sudo chmod 644 /etc/sysctl.conf

printf "      >> Upgrading Python pip\n"
python3 -m pip install --upgrade pip > /dev/null 2>&1
python2.7 -m pip install --upgrade pip > /dev/null 2>&1

# preparing elastic
printf "      >> Preparing elastic stack\n"
wget -O elastic.py "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083290&authkey=ADWrcfFoW6cbo2M" > /dev/null 2>&1
sudo mv elastic.py /opt/kasm/kasm/build/install/

# installing apfs-fuse
printf "      >> Installing apfs-fuse\n"
sudo apt install libbz2-dev libattr1-dev cmake cmake-curses-gui -y --fix-missing > /dev/null 2>&1
cd /usr/local/bin
sudo git clone https://github.com/ezaspy/apfs-fuse.git > /dev/null 2>&1
cd apfs-fuse
sudo git submodule init
sudo git submodule update
sudo mkdir build
cd build
sudo cmake ..
sudo ccmake .
sudo make

# installing virtualisation software
printf "      >> Installing Virtualisation software\n"
cd /home/sansforensics/
sudo wget https://download3.vmware.com/software/WKST-PLAYER-1624/VMware-Player-Full-16.2.4-20089737.x86_64.bundle > /dev/null 2>&1
sudo chmod +x VMware-Player-Full-16.2.4-20089737.x86_64.bundle
sudo ./VMware-Player-Full-16.2.4-20089737.x86_64.bundle > /dev/null 2>&1
echo "sudo wget -O virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb https://download.virtualbox.org/virtualbox/7.0.2/virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb
sudo dpkg -i virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections" > virtualbox.sh
chmod +x virtualbox.sh
./virtualbox.sh > /dev/null 2>&1
sudo rm -rf VMware-Player-Full-16.2.4-20089737.x86_64.bundle virtualbox.sh virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb

# initialising elrond
printf "      >> Initialising elrond\n"
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond > /dev/null 2>&1
sudo chmod -R 777 /opt/elrond/elrond/config.sh
sudo sed -i '7d' /opt/elrond/elrond/config.sh
sudo sed -i '$ d' /opt/elrond/elrond/config.sh
# preparing navigator
sudo cp /opt/elrond/elrond/rivendell/post/mitre/nav_json.py /opt/kasm/kasm/build/install/nav_json.py

# installing elrond
printf "      >> Installing elrond\n"
sudo /opt/elrond/./make.sh > /dev/null 2>&1
sudo updatedb > /dev/null 2>&1

/opt/kasm/kasm/build/./temp.sh