#!/bin/bash
banner="\n  ##########################################################\n  #--- \033[1;33mCommenced KASM-Workstation configuration script\033[0m  ---#\n  ##########################################################\n  # \033[1;34m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\033[0m #\n  ##########################################################\n  |      \033[1;33mPlease note the following:\033[0m                        |\n  |          -> \033[1;33mConfiguring KASM takes ~10 hours\033[0m           |\n  |          -> \033[1;33mEnsure you have BUILD.md to hand\033[0m           |\n  |          -> \033[1;33mSelect the options as instructed\033[0m           |\n  ##########################################################\n\n"

clear
printf "
  ##########################################################
  ---- \033[1;33mCommencing KASM-Workstation configuration script\033[0m ----
  ##########################################################"
printf "\n  \033[1;34m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\033[0m
  ##########################################################
  |      \033[1;33mPlease note the following:\033[0m                        |
  |          -> \033[1;33mConfiguring KASM takes ~10 hours\033[0m           |
  |          -> \033[1;33mEnsure you have BUILD.md to hand\033[0m           |
  |          -> \033[1;33mSelect the options as instructed\033[0m           |
  ##########################################################
"
sleep 2
# initialising kasm
printf "\n    >> Initialising KASM-Workstation\n"
sudo chmod -R 755 /opt/kasm
python3 -m keyring --disable
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.session idle-delay 0
sudo apt update > /dev/null 2>&1
# preparing elastic
wget -O elastic.py "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083290&authkey=ADWrcfFoW6cbo2M" > /dev/null 2>&1
sudo mv elastic.py /opt/kasm/kasm/build/install/

# creating cuckoo user
clear
printf "$banner"
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> Creating 'cuckoo' account\n"
sudo useradd -m -u 6478 -p $(openssl passwd -1 cuckoo) cuckoo && sudo usermod -aG sudo cuckoo > /dev/null 2>&1
sleep 1
sudo passwd cuckoo
sleep 2

# installing apfs-fuse
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> Installing apfs-fuse\n"
sudo apt install libbz2-dev libattr1-dev cmake cmake-curses-gui -y > /dev/null 2>&1
cd /usr/local/bin
sudo git clone https://github.com/ezaspy/apfs-fuse.git > /dev/null 2>&1
cd apfs-fuse
sudo git submodule init > /dev/null 2>&1
sudo git submodule update > /dev/null 2>&1
sudo mkdir build
cd build
sudo cmake .. > /dev/null 2>&1
sudo ccmake .
sudo make > /dev/null 2>&1
cd /home/sansforensics/

# installing remnux - MUST be installed before anything else
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> Installing REMnux\n"
wget https://REMnux.org/remnux-cli > /dev/null 2>&1
mv remnux-cli remnux
chmod +x remnux
sudo mv remnux /usr/local/bin
#sudo remnux install > /dev/null 2>&1

# configuring repositories
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> Updating repositories\n"
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser # db browser for sqlite
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg > /dev/null 2>&1 # thehive
sleep 2
yes '' | echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # thehive / cuckoo
sleep 2
yes '' | sudo add-apt-repository ppa:mrazavi/gvm > /dev/null 2>&1 # greenbone
echo 'deb http://security.ubuntu.com/ubuntu xenial-security main' | sudo tee /etc/apt/sources.list.d/xenial-security.list > /dev/null 2>&1 # cuckoo
wget -O /tmp/python-mysqldb_1.3.10-1build1_amd64.deb http://archive.ubuntu.com/ubuntu/pool/main/p/python-mysqldb/python-mysqldb_1.3.10-1build1_amd64.deb > /dev/null 2>&1 # cuckoo
sleep 4
#yes '' | sudo add-apt-repository ppa:micahflee/ppa > /dev/null 2>&1 # tor
sudo apt update > /dev/null 2>&1

#options=$(cat /home/sansforensics/.vars)

# installing cuckoo
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> Installing Cuckoo Sandbox\n"
wget -O agent.pyw "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083287&authkey=AO9ecFMM8pXll1E" > /dev/null 2>&1
sudo mv agent.pyw /opt/kasm/kasm/build/install/ > /dev/null 2>&1
# installing components
sudo apt-get install libmysqlclient20 libffi-dev libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev python-setuptools libjpeg-dev zlib1g-dev libxml2-dev libxslt1-dev libevent-dev libpcre3 libpcre3-dev libtool libpcre++-dev g++ automake dkms unzip wget python-sqlalchemy python-jinja2 python-magic python-mysqldb python-chardet mongodb postgresql libpq-dev tcpdump libcap2-bin apparmor-utils ssdeep python-pyrex subversion libfuzzy-dev swig vsftpd libjansson-dev libmagic-dev libtool-bin /tmp/./python-mysqldb_1.3.10-1build1_amd64.deb -y
pip2 install virtualenv bson dpkt gridfs-fuse bottle cybox==2.0.1.4 maec "Django<2" m2crypto==0.31.0 IPython==5.0 jupyter openpyxl ujson
sudo -H pip2 install ansible --upgrade
#sudo aa-disable /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
getcap /usr/sbin/tcpdump
wget -O distorm-3.4.1.tar.gz https://github.com/gdabah/distorm/archive/refs/tags/v3.4.1.tar.gz
wget -O yara-3.8.1.tar.gz https://github.com/VirusTotal/yara/archive/refs/tags/v3.8.1.tar.gz
tar -zxvf distorm-3.4.1.tar.gz
cd distorm-3.4.1
sudo python2.7 setup.py install
cd ..
sudo tar -zxvf yara-3.8.1.tar.gz
cd yara-3.8.1
sudo ./bootstrap.sh
sudo ./configure --with-crypto --enable-magic --enable-cuckoo
sudo make
sudo make install
sudo -H pip2 install yara-python
cd ..
sudo rm -rf python-mysqldb_1.3.10-1build1_amd64.deb
sudo rm -rf distorm-3.4.1
sudo rm -rf distorm-3.4.1.tar.gz
sudo rm -rf build.sh
sudo rm -rf yara-3.8.1
sudo rm -rf yara-3.8.1.tar.gz
# configuring ftp server
sudo cat /etc/vsftpd.conf > vsftpd.conf.bak
sudo mv vsftpd.conf.bak /etc/
sudo chmod 644 /etc/vsftpd.conf.bak
sudo sed -i '14s/listen=NO/listen=YES/' /etc/vsftpd.conf
sudo sed -i '22s/listen_ipv6=YES/listen_ipv6=NO/' /etc/vsftpd.conf
sudo sed -i '25s/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd.conf
sudo sed -i '31s/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sudo sed -i '44s/#anon_upload_enable=YES/anon_upload_enable=YES/' /etc/vsftpd.conf
sudo sed -i '44s/#anon_mkdir_write_enable=YES/anon_mkdir_write_enable=YES/' /etc/vsftpd.conf
sudo service vsftpd restart
# sorting cuckoo user
sudo groupadd libvirt
sudo groupadd pcap
sudo usermod -L cuckoo
sudo usermod -a -G kvm cuckoo
sudo usermod -a -G libvirt cuckoo
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
sudo mkdir -p /home/cuckoo/vmshared/pub
sudo chmod -R ug=rwX,o=rX /home/cuckoo/vmshared/
sudo chmod -R ugo=rwX /home/cuckoo/vmshared/pub
# configure cuckoo
sudo virtualenv venv
. venv/bin/activate
pip2 install -U setuptools cuckoo
/home/sansforensics/.local/bin/cuckoo -d
sudo cp /opt/kasm/kasm/build/install/agent.pyw /home/cuckoo/vmshared/
sudo systemctl enable mongodb.service
sudo service mongodb start
sed -i '45s/enabled = no/enabled = yes/' /home/sansforensics/.cuckoo/conf/reporting.conf
sed -i '10s/= no/= yes/' /home/sansforensics/.cuckoo/conf/cuckoo.conf
sudo service mongodb restart
deactivate

# installing thehive
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> Installing TheHive\n"
sudo adduser --system docker
sudo groupadd docker
sudo usermod -aG docker docker
sudo apt-get install ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin dbus-user-session -y
sudo docker run -d=true --rm -p 9000:9000 strangebee/thehive:latest
sudo rm /etc/apt/sources.list.d/docker.list

# installing misp
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> Installing MISP\n"
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp && sudo usermod -aG sudo misp > /dev/null 2>&1
wget -O /tmp/INSTALL_orig.sh https://raw.githubusercontent.com/MISP/MISP/2.4/INSTALL/INSTALL.sh > /dev/null 2>&1
sudo chmod +x /tmp/INSTALL_orig.sh
sudo python3 /opt/kasm/kasm/build/install/./misp.py > /dev/null 2>&1
sudo chmod 777 /tmp/INSTALL.sh
#sudo dpkg --configure -a && sudo apt install --reinstall python3-six && sudo apt install --reinstall python3-chardet && pip install pytz
bash /tmp/INSTALL.sh -c -M -u > /dev/null 2>&1
sudo rm /tmp/INSTALL.sh
sudo ufw allow 80/tcp > /dev/null 2>&1
sudo ufw allow 443/tcp > /dev/null 2>&1

# installing greenbone
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> \033[1;32mInstalled MISP\033[0m\n    >> Installing Greenbone Vulnerability Manager\n"
sudo apt install postgresql libvirt-daemon -y > /dev/null 2>&1
sudo apt install gvm -y
sudo -u gvm -g gvm greenbone-nvt-sync > /dev/null 2>&1
#sudo -u gvm -g gvm greenbone-feed-sync --type CERT > /dev/null 2>&1
#sudo -u gvm -g gvm greenbone-feed-sync --type SCAP > /dev/null 2>&1
#sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA > /dev/null 2>&1
#export $(sudo cat /etc/default/gvmd-pg)
#sudo pg_ctlcluster 12 main start > /dev/null 2>&1

# removing uneeded applications
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> \033[1;32mInstalled MISP\033[0m\n    >> \033[1;32mInstalled Greenbone Vulnerability Manager\033[0m\n    >> Uninstalling redundant software\n"
sudo du -sh /var/cache/apt/archives > /dev/null 2>&1
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* kdeconnect aisleriot gnome-mines gnome-sudoku gnome-mahjongg cheese ghex simple-scan wxhexeditor scite -y > /dev/null 2>&1
sudo apt-get autoremove --purge > /dev/null 2>&1
sudo apt-get clean > /dev/null 2>&1
# disabling updates via ipv6
sudo chmod 777 /etc/sysctl.conf
sudo echo "

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
" >> /etc/sysctl.conf
sudo chmod 644 /etc/sysctl.conf

# installing virtualisation software
clear
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> \033[1;32mInstalled MISP\033[0m\n    >> \033[1;32mInstalled Greenbone Vulnerability Manager\033[0m\n    >> \033[1;32mUninstalling redundant software\033[0m\n    >> Installing virtualisation software\n"
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

# downloading additional tooling
/opt/kasm/kasm/build/install/./tools.sh
/opt/kasm/kasm/build/./temp.sh