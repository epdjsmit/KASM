#!/bin/bash
banner="\n  ###################################################\n  |   \033[1;33mPlease note the following:\033[0m                    |\n  |     -> \033[1;33mConfiguring KASM can take ~10 hours\033[0m      |\n  |     -> \033[1;33mEnsure BUILD.md is available to you\033[0m      |\n  |     -> \033[1;33mInvoke the selections when prompted\033[0m      |\n  ###################################################\n"
vars=$(cat /home/sansforensics/.vars)
length=${#vars}
sleep 2

clear
# initialising kasm
printf "$banner\n    >> Initialising KASM-Workstation\n"
sudo chmod -R 755 /opt/kasm
python3 -m keyring --disable
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.session idle-delay 0
sudo apt update > /dev/null 2>&1
# installing apfs-fuse
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

# -c has been selected
if [[ $vars = *cuckoo* ]] || [ $length -eq "0" ]; then
  # creating cuckoo user
  clear
  printf "$banner\n    >> Creating 'cuckoo' account\n"
  sudo useradd -m -u 6478 -p $(openssl passwd -1 cuckoo) cuckoo && sudo usermod -aG sudo cuckoo > /dev/null 2>&1
  sleep 1
  sudo passwd cuckoo
  sleep 2
fi

echo now="$(date)" >> date.txt && echo " - pre-remnux
" >> date.txt # testing execution duration

# -r has been selected
#Fri 09 Dec 2022 02:57:46 PM UTC
#Fri 09 Dec 2022 06:49:28 PM UTC
if [[ $vars = *remnux* ]] || [ $length -eq "0" ]; then # 4 hours
  # installing remnux - MUST be installed before anything else
  clear
  printf "$banner\n    >> Installing REMnux\n"
  wget https://REMnux.org/remnux-cli > /dev/null 2>&1
  mv remnux-cli remnux
  chmod +x remnux
  sudo mv remnux /usr/local/bin
  sudo remnux install > /dev/null 2>&1
  remnux_install_or_skip=">> \033[1;32mInstalled   REMnux\033[0m"
else
  remnux_install_or_skip="-- \033[1;30mSkipped     REMnux\033[0m"
fi

echo now="$(date)" > date.txt && echo " - post-remnux
" >> date.txt # testing execution duration

# configuring repositories
clear
printf "$banner\n    $remnux_install_or_skip\n    >> Updating repositories\n"
sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser > /dev/null 2>&1 # db browser for sqlite
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg > /dev/null 2>&1 # thehive
sleep 2
yes '' | echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # thehive / cuckoo
sleep 2
yes '' | sudo add-apt-repository ppa:mrazavi/gvm > /dev/null 2>&1 # greenbone
echo 'deb http://security.ubuntu.com/ubuntu xenial-security main' | sudo tee /etc/apt/sources.list.d/xenial-security.list > /dev/null 2>&1 # cuckoo
wget -O /tmp/python-mysqldb_1.3.10-1build1_amd64.deb http://archive.ubuntu.com/ubuntu/pool/main/p/python-mysqldb/python-mysqldb_1.3.10-1build1_amd64.deb > /dev/null 2>&1 # cuckoo
sleep 4
#yes '' | sudo add-apt-repository ppa:micahflee/ppa > /dev/null 2>&1 # tor
python3 -m pip install --upgrade pip > /dev/null 2>&1
python2.7 -m pip install --upgrade pip > /dev/null 2>&1
sudo apt update > /dev/null 2>&1

clear
printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> Uninstalling redundant software\n"
# disabling updates via ipv6
sudo chmod 777 /etc/sysctl.conf
sudo echo "

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
" >> /etc/sysctl.conf
# removing uneeded applications
sudo chmod 644 /etc/sysctl.conf
sudo du -sh /var/cache/apt/archives > /dev/null 2>&1
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* kdeconnect aisleriot gnome-mines gnome-sudoku gnome-mahjongg cheese ghex simple-scan wxhexeditor scite -y > /dev/null 2>&1
sudo apt-get autoremove --purge > /dev/null 2>&1
sudo apt-get clean > /dev/null 2>&1

# installing virtualisation engines
clear
printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mRemoved     redundant software\033[0m\n    >> Installing virtualisation engines\n"
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

clear
printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mRemoved     redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> Installing elrond\n"
sudo git clone https://github.com/ezaspy/elrond.git /opt/elrond > /dev/null 2>&1
sudo chmod -R 777 /opt/elrond/elrond/config.sh
sudo sed -i '7d' /opt/elrond/elrond/config.sh
sudo sed -i '$ d' /opt/elrond/elrond/config.sh
# preparing elastic
wget -O elastic.py "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083290&authkey=ADWrcfFoW6cbo2M" > /dev/null 2>&1
sudo mv elastic.py /opt/kasm/kasm/build/install/
# preparing navigator
sudo cp /opt/elrond/elrond/rivendell/post/mitre/nav_json.py /opt/kasm/kasm/build/install/navigator.py
sudo /opt/elrond/./make.sh > /dev/null 2>&1

# -c has been selected
if [[ $vars = *cuckoo* ]] || [ $length -eq "0" ]; then
  cuckoo_install_or_skip=">> \033[1;32mInstalled   Cuckoo Sandbox\033[0m"
else
  cuckoo_install_or_skip="-- \033[1;30mSkipped     Cuckoo Sandbox\033[0m"
fi

# -t has been selected
if [[ $vars = *thp* ]] || [ $length -eq "0" ]; then
  thehive_install_or_skip=">> \033[1;32mInstalled   TheHive\033[0m"
else
  thehive_install_or_skip="-- \033[1;30mSkipped     TheHive\033[0m"
fi

# -t has been selected
if [[ $vars = *misp* ]] || [ $length -eq "0" ]; then
  misp_install_or_skip=">> \033[1;32mInstalled   MISP\033[0m"
else
  misp_install_or_skip="-- \033[1;30mSkipped     MISP\033[0m"
fi

# -g has been selected
if [[ $vars = *greenbone* ]] || [ $length -eq "0" ]; then
  greenbone_install_or_skip=">> \033[1;32mInstalled   Greenbone Vulnerability Manager\033[0m"
else
  greenbone_install_or_skip="-- \033[1;30mSkipped     Greenbone Vulnerability Manager\033[0m"
fi

echo $remnux_install_or_skip $cuckoo_install_or_skip $thehive_install_or_skip $misp_install_or_skip $greenbone_install_or_skip > .install_or_skip

# downloading additional tooling
/opt/kasm/kasm/build/install/./tools.sh
/opt/kasm/kasm/build/./temp.sh