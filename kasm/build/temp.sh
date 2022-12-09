#!/bin/bash
banner="\n  ###################################################\n  |   \033[1;33mPlease note the following:\033[0m                    |\n  |     -> \033[1;33mConfiguring KASM can take ~10 hours\033[0m      |\n  |     -> \033[1;33mEnsure BUILD.md is available to you\033[0m      |\n  |     -> \033[1;33mInvoke the selections when prompted\033[0m      |\n  ###################################################\n"
install_or_skip=$(cat /home/sansforensics/.install_or_skip)

if [[ $install_or_skip = *Installed\ REMnux* ]]; then
  remnux_install_or_skip=">> \033[1;32mInstalled   REMnux\033[0m"
else
  remnux_install_or_skip="-- \033[1;30mSkipped     REMnux\033[0m"
fi

if [[ $install_or_skip = *Installed\ Cuckoo* ]]; then
  # installing cuckoo
  clear
  printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    >> Installing Cuckoo Sandbox\n"
  wget -O agent.pyw "https://onedrive.live.com/embed?cid=6B2C69CA86AC3FC8&resid=6B2C69CA86AC3FC8%213083287&authkey=AO9ecFMM8pXll1E" > /dev/null 2>&1
  sudo mv agent.pyw /opt/kasm/kasm/build/install/ > /dev/null 2>&1
  # installing components
  sudo apt-get install libmysqlclient20 libffi-dev libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev python-setuptools libjpeg-dev zlib1g-dev libxml2-dev libxslt1-dev libevent-dev libpcre3 libpcre3-dev libtool libpcre++-dev g++ automake dkms unzip wget python-sqlalchemy python-jinja2 python-magic python-mysqldb python-chardet mongodb postgresql libpq-dev tcpdump libcap2-bin apparmor-utils ssdeep python-pyrex subversion libfuzzy-dev swig vsftpd libjansson-dev libmagic-dev libtool-bin /tmp/./python-mysqldb_1.3.10-1build1_amd64.deb -y > /dev/null 2>&1
  pip2 install virtualenv bson dpkt gridfs-fuse bottle cybox==2.0.1.4 maec "Django<2" m2crypto==0.31.0 IPython==5.0 jupyter openpyxl ujson > /dev/null 2>&1
  sudo -H pip2 install ansible --upgrade > /dev/null 2>&1
  #sudo aa-disable /usr/sbin/tcpdump
  sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump > /dev/null 2>&1
  getcap /usr/sbin/tcpdump > /dev/null 2>&1
  wget -O distorm-3.4.1.tar.gz https://github.com/gdabah/distorm/archive/refs/tags/v3.4.1.tar.gz > /dev/null 2>&1
  wget -O yara-3.8.1.tar.gz https://github.com/VirusTotal/yara/archive/refs/tags/v3.8.1.tar.gz > /dev/null 2>&1
  tar -zxvf distorm-3.4.1.tar.gz > /dev/null 2>&1
  cd distorm-3.4.1 > /dev/null 2>&1
  sudo python2.7 setup.py install > /dev/null 2>&1
  cd .. > /dev/null 2>&1
  sudo tar -zxvf yara-3.8.1.tar.gz > /dev/null 2>&1
  cd yara-3.8.1 > /dev/null 2>&1
  sudo ./bootstrap.sh > /dev/null 2>&1
  sudo ./configure --with-crypto --enable-magic --enable-cuckoo > /dev/null 2>&1
  sudo make > /dev/null 2>&1
  sudo make install > /dev/null 2>&1
  sudo -H pip2 install yara-python > /dev/null 2>&1
  cd .. > /dev/null 2>&1
  sudo rm -rf python-mysqldb_1.3.10-1build1_amd64.deb > /dev/null 2>&1
  sudo rm -rf distorm-3.4.1 > /dev/null 2>&1
  sudo rm -rf distorm-3.4.1.tar.gz > /dev/null 2>&1
  sudo rm -rf build.sh > /dev/null 2>&1
  sudo rm -rf yara-3.8.1 > /dev/null 2>&1
  sudo rm -rf yara-3.8.1.tar.gz > /dev/null 2>&1
  # configuring ftp server
  sudo cat /etc/vsftpd.conf > vsftpd.conf.bak > /dev/null 2>&1
  sudo mv vsftpd.conf.bak /etc/ > /dev/null 2>&1
  sudo chmod 644 /etc/vsftpd.conf.bak > /dev/null 2>&1
  sudo sed -i '14s/listen=NO/listen=YES/' /etc/vsftpd.conf > /dev/null 2>&1
  sudo sed -i '22s/listen_ipv6=YES/listen_ipv6=NO/' /etc/vsftpd.conf > /dev/null 2>&1
  sudo sed -i '25s/anonymous_enable=NO/anonymous_enable=YES/' /etc/vsftpd.conf > /dev/null 2>&1
  sudo sed -i '31s/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf > /dev/null 2>&1
  sudo sed -i '44s/#anon_upload_enable=YES/anon_upload_enable=YES/' /etc/vsftpd.conf > /dev/null 2>&1
  sudo sed -i '44s/#anon_mkdir_write_enable=YES/anon_mkdir_write_enable=YES/' /etc/vsftpd.conf > /dev/null 2>&1
  sudo service vsftpd restart > /dev/null 2>&1
  # sorting cuckoo user
  sudo groupadd libvirt > /dev/null 2>&1
  sudo groupadd pcap > /dev/null 2>&1
  sudo usermod -L cuckoo > /dev/null 2>&1
  sudo usermod -a -G kvm cuckoo > /dev/null 2>&1
  sudo usermod -a -G libvirt cuckoo > /dev/null 2>&1
  sudo usermod -a -G pcap cuckoo > /dev/null 2>&1
  sudo chgrp pcap /usr/sbin/tcpdump > /dev/null 2>&1
  sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump > /dev/null 2>&1
  sudo mkdir -p /home/cuckoo/vmshared/pub > /dev/null 2>&1
  sudo chmod -R ug=rwX,o=rX /home/cuckoo/vmshared/ > /dev/null 2>&1
  sudo chmod -R ugo=rwX /home/cuckoo/vmshared/pub > /dev/null 2>&1
  # configure cuckoo
  sudo virtualenv venv > /dev/null 2>&1
  . venv/bin/activate > /dev/null 2>&1
  pip2 install -U setuptools cuckoo > /dev/null 2>&1
  /home/sansforensics/.local/bin/cuckoo -d > /dev/null 2>&1
  sudo cp /opt/kasm/kasm/build/install/agent.pyw /home/cuckoo/vmshared/ > /dev/null 2>&1
  sudo systemctl enable mongodb.service > /dev/null 2>&1
  sudo service mongodb start > /dev/null 2>&1
  sed -i '45s/enabled = no/enabled = yes/' /home/sansforensics/.cuckoo/conf/reporting.conf > /dev/null 2>&1
  sed -i '10s/= no/= yes/' /home/sansforensics/.cuckoo/conf/cuckoo.conf > /dev/null 2>&1
  sudo service mongodb restart > /dev/null 2>&1
  deactivate > /dev/null 2>&1
  cuckoo_install_or_skip=">> \033[1;32mInstalled   Cuckoo Sandbox\033[0m"
else
  cuckoo_install_or_skip="-- \033[1;30mSkipped     Cuckoo Sandbox\033[0m"
fi

if [[ $install_or_skip = *Installed\ TheHive* ]]; then
  # installing thehive
  clear
  printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    $cuckoo_install_or_skip\n    >> Installing TheHive\n"
  sudo adduser --system docker > /dev/null 2>&1
  sudo groupadd docker > /dev/null 2>&1
  sudo usermod -aG docker docker > /dev/null 2>&1
  sudo apt-get install ca-certificates curl gnupg lsb-release docker-ce docker-ce-cli containerd.io docker-compose-plugin dbus-user-session -y > /dev/null 2>&1
  sudo docker run -d=true --rm -p 9000:9000 strangebee/thehive:latest > /dev/null 2>&1
  sudo rm /etc/apt/sources.list.d/docker.list > /dev/null 2>&1
  thehive_install_or_skip=">> \033[1;32mInstalled   TheHive\033[0m"
else
  thehive_install_or_skip="-- \033[1;30mSkipped     TheHive\033[0m"
fi

if [[ $install_or_skip = *Installed\ MISP* ]]; then
  # installing misp
  clear
  printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    >> Installing MISP\n"
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
  misp_install_or_skip=">> \033[1;32mInstalled   MISP\033[0m"
else
  misp_install_or_skip="-- \033[1;30mSkipped     MISP\033[0m"
fi

echo now="$(date)" > date.txt && echo " - pre-greenbone
" >> date.txt # testing execution duration

if [[ $install_or_skip = *Installed\ Greenbone\ Vulnerability\ Manager* ]]; then
  # installing greenbone
  clear
  printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    >> Installing Greenbone Vulnerability Manager\n"
  sudo apt install postgresql libvirt-daemon -y > /dev/null 2>&1
  sudo apt install gvm -y
  sudo -u gvm -g gvm greenbone-nvt-sync > /dev/null 2>&1
  sudo -u gvm -g gvm greenbone-feed-sync --type CERT > /dev/null 2>&1
  sudo -u gvm -g gvm greenbone-feed-sync --type SCAP > /dev/null 2>&1
  sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA > /dev/null 2>&1
  export $(sudo cat /etc/default/gvmd-pg)
  sudo pg_ctlcluster 12 main start > /dev/null 2>&1
  greenbone_install_or_skip=">> \033[1;32mInstalled   Greenbone Vulnerability Manager\033[0m"
else
  greenbone_install_or_skip="-- \033[1;30mSkipped     Greenbone Vulnerability Manager\033[0m"
fi

echo now="$(date)" > date.txt && echo " - post-greenbone
" >> date.txt # testing execution duration

# initialising temp account
clear
printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mUpgraded    Python pip\033[0m\n    >> \033[1;32mInstalled   Jupyter Notebooks\033[0m\n    >> \033[1;32mInstalled   Chrome Browser\033[0m\n    >> \033[1;32mInstalled   Opera Browser\033[0m\n    >> \033[1;32mInstalled   DB Browser for SQLite\033[0m\n    >> \033[1;32mInstalled   Azure CLI\033[0m\n    >> \033[1;32mInstalled   AWS CLI\033[0m\n    >> \033[1;32mInstalled   Bookstack\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    >> \033[1;32mDownloaded  additional tooling\033[0m\n      >> \033[1;34mDownloaded  onestopcybershop\033[0m\n      >> \033[1;34mDownloaded  gandalf\033[0m\n      >> \033[1;34mDownloaded  bruce\033[0m\n      >> \033[1;34mDownloaded  SIGMA\033[0m\n      >> \033[1;34mDownloaded  DeepBlueCLI\033[0m\n      >> \033[1;34mDownloaded  KAPE\033[0m\n      >> \033[1;34mDownloaded  PowerForensics\033[0m\n      >> \033[1;34mDownloaded  MemProcFS\033[0m\n      >> \033[1;34mDownloaded  WMIExplorer\033[0m\n      >> \033[1;34mDownloaded  CobaltStrike-Defence\033[0m\n      >> \033[1;34mDownloaded  freq\033[0m\n      >> \033[1;34mDownloaded  dnstwist\033[0m\n      >> \033[1;34mDownloaded  rdap\033[0m\n      >> \033[1;34mDownloaded  sherlock\033[0m\n      >> \033[1;34mDownloaded  TweetScraper\033[0m\n      >> \033[1;34mDownloaded  karma\033[0m\n      >> \033[1;34mDownloaded  TZWorks\033[0m\n      >> \033[1;34mDownloaded  BlueTeamPowerShell\033[0m\n      >> \033[1;34mDownloaded  Sysmon\033[0m\n    >> \033[1;32mInstalled   Metasploit\033[0m\n    >> \033[1;32mInstalled   HTTrack\033[0m\n    >> \033[1;32mInstalled   Maltego\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    $greenbone_install_or_skip\n    >> Creating 'temp' account\n"
sudo hostnamectl set-hostname kasm > /dev/null 2>&1
hostname | (echo -n "127.0.0.1        " && cat) | sudo tee -a /etc/hosts > /dev/null 2>&1
sleep 1
sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp
sudo passwd temp
sleep 2
clear
printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mUpgraded    Python pip\033[0m\n    >> \033[1;32mInstalled   Jupyter Notebooks\033[0m\n    >> \033[1;32mInstalled   Chrome Browser\033[0m\n    >> \033[1;32mInstalled   Opera Browser\033[0m\n    >> \033[1;32mInstalled   DB Browser for SQLite\033[0m\n    >> \033[1;32mInstalled   Azure CLI\033[0m\n    >> \033[1;32mInstalled   AWS CLI\033[0m\n    >> \033[1;32mInstalled   Bookstack\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    >> \033[1;32mDownloaded  additional tooling\033[0m\n      >> \033[1;34mDownloaded  onestopcybershop\033[0m\n      >> \033[1;34mDownloaded  gandalf\033[0m\n      >> \033[1;34mDownloaded  bruce\033[0m\n      >> \033[1;34mDownloaded  SIGMA\033[0m\n      >> \033[1;34mDownloaded  DeepBlueCLI\033[0m\n      >> \033[1;34mDownloaded  KAPE\033[0m\n      >> \033[1;34mDownloaded  PowerForensics\033[0m\n      >> \033[1;34mDownloaded  MemProcFS\033[0m\n      >> \033[1;34mDownloaded  WMIExplorer\033[0m\n      >> \033[1;34mDownloaded  CobaltStrike-Defence\033[0m\n      >> \033[1;34mDownloaded  freq\033[0m\n      >> \033[1;34mDownloaded  dnstwist\033[0m\n      >> \033[1;34mDownloaded  rdap\033[0m\n      >> \033[1;34mDownloaded  sherlock\033[0m\n      >> \033[1;34mDownloaded  TweetScraper\033[0m\n      >> \033[1;34mDownloaded  karma\033[0m\n      >> \033[1;34mDownloaded  TZWorks\033[0m\n      >> \033[1;34mDownloaded  BlueTeamPowerShell\033[0m\n      >> \033[1;34mDownloaded  Sysmon\033[0m\n    >> \033[1;32mInstalled   Metasploit\033[0m\n    >> \033[1;32mInstalled   HTTrack\033[0m\n    >> \033[1;32mInstalled   Maltego\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    $greenbone_install_or_skip\n    >> Configuring 'temp' account\n"

# autologin for temp account
echo "# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncomment the line below to force the login screen to use Xorg
#WaylandEnable=false

# Enabling automatic login
  AutomaticLoginEnable = true
  AutomaticLogin = temp

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true" > custom.conf
sudo mv custom.conf /etc/gdm3/custom.conf
sudo chmod 644 /etc/gdm3/custom.conf

# autostarting temp.sh upon login for temp account
echo "[Desktop Entry]
Type=Application
Exec=gnome-terminal -- /home/temp/./temp.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_NG]=Terminal
Name=Terminal
Comment[en_NG]=Start Terminal On Startup
Comment=Start Terminal On Startup" > gnome-terminal.desktop
sudo mkdir -p /home/temp/.config/autostart/
sudo mv gnome-terminal.desktop /home/temp/.config/autostart/
sudo chmod 755 /home/temp/.config/autostart/gnome-terminal.desktop

# temp user setting up ninja account
echo "sudo usermod -l ninja sansforensics # change username
sudo usermod -d /home/ninja -m ninja # change home folder
sudo chfn -f 'ninja' ninja # change 'name'
sudo groupmod --new-name ninja sansforensics # change group
sudo rm /home/ninja/.local/share/keyrings/login.keyring
sleep 1
echo '# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncomment the line below to force the login screen to use Xorg
#WaylandEnable=false

# Enabling automatic login
  AutomaticLoginEnable = true
  AutomaticLogin = ninja

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true' > custom.conf
sudo mv custom.conf /etc/gdm3/custom.conf
sudo chmod 644 /etc/gdm3/custom.conf
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- /home/ninja/./ninja.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_NG]=Terminal
Name=Terminal
Comment[en_NG]=Start Terminal On Startup
Comment=Start Terminal On Startup' > gnome-terminal.desktop
sudo mkdir -p /home/ninja/.config/autostart/
sudo mv gnome-terminal.desktop /home/ninja/.config/autostart/
sudo chmod 755 /home/ninja/.config/autostart/gnome-terminal.desktop
sleep 1
sudo cp /opt/kasm/kasm/build/ninja.sh /home/ninja/ninja.sh
sudo chmod +x /home/ninja/ninja.sh
sudo cp /opt/elrond/elrond/tools/config/scripts/virtual.sh /home/ninja/VMware_Tools.sh
sudo chmod +x /home/ninja/VMware_Tools.sh
sleep 1
clear" > temp.sh
echo "printf \"    >> Creating 'ninja' account\n\"" >> temp.sh
echo "sudo passwd ninja
sleep 1
gnome-session-quit --no-prompt" >> temp.sh
sudo chmod +x temp.sh
sudo mv temp.sh /home/temp/temp.sh
clear
printf "$banner\n    $remnux_install_or_skip\n    >> \033[1;32mUpdated     repositories\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled   virtualisation engines\033[0m\n    >> \033[1;32mUpgraded    Python pip\033[0m\n    >> \033[1;32mInstalled   Jupyter Notebooks\033[0m\n    >> \033[1;32mInstalled   Chrome Browser\033[0m\n    >> \033[1;32mInstalled   Opera Browser\033[0m\n    >> \033[1;32mInstalled   DB Browser for SQLite\033[0m\n    >> \033[1;32mInstalled   Azure CLI\033[0m\n    >> \033[1;32mInstalled   AWS CLI\033[0m\n    >> \033[1;32mInstalled   Bookstack\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    >> \033[1;32mDownloaded  additional tooling\033[0m\n      >> \033[1;34mDownloaded  onestopcybershop\033[0m\n      >> \033[1;34mDownloaded  gandalf\033[0m\n      >> \033[1;34mDownloaded  bruce\033[0m\n      >> \033[1;34mDownloaded  SIGMA\033[0m\n      >> \033[1;34mDownloaded  DeepBlueCLI\033[0m\n      >> \033[1;34mDownloaded  KAPE\033[0m\n      >> \033[1;34mDownloaded  PowerForensics\033[0m\n      >> \033[1;34mDownloaded  MemProcFS\033[0m\n      >> \033[1;34mDownloaded  WMIExplorer\033[0m\n      >> \033[1;34mDownloaded  CobaltStrike-Defence\033[0m\n      >> \033[1;34mDownloaded  freq\033[0m\n      >> \033[1;34mDownloaded  dnstwist\033[0m\n      >> \033[1;34mDownloaded  rdap\033[0m\n      >> \033[1;34mDownloaded  sherlock\033[0m\n      >> \033[1;34mDownloaded  TweetScraper\033[0m\n      >> \033[1;34mDownloaded  karma\033[0m\n      >> \033[1;34mDownloaded  TZWorks\033[0m\n      >> \033[1;34mDownloaded  BlueTeamPowerShell\033[0m\n      >> \033[1;34mDownloaded  Sysmon\033[0m\n    >> \033[1;32mInstalled   Metasploit\033[0m\n    >> \033[1;32mInstalled   HTTrack\033[0m\n    >> \033[1;32mInstalled   Maltego\033[0m\n    >> \033[1;32mInstalled   elrond\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    $greenbone_install_or_skip\n    >> \033[1;32mConfigured 'temp' account\033[0m\n    >> Rebooting...\n"
sleep 10
sudo reboot