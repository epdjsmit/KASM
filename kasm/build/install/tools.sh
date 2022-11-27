#!/bin/bash
# GENERAL
sudo wget https://download3.vmware.com/software/WKST-PLAYER-1624/VMware-Player-Full-16.2.4-20089737.x86_64.bundle
sudo chmod +x VMware-Player-Full-16.2.4-20089737.x86_64.bundle
sudo ./VMware-Player-Full-16.2.4-20089737.x86_64.bundle
sudo rm -rf VMware-Player-Full-16.2.4-20089737.x86_64.bundle
sudo rm -rf virtualbox-7.0_7.0.2-154219~Ubuntu~focal_amd64.deb
clear
sleep 1
printf "\n\n  -> Installing browsers...\n\n"
sleep 1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo rm -rf google-chrome-stable_current_amd64.deb
sudo snap install opera
sudo apt install torbrowser-launcher -y
torbrowser-launcher
clear
sleep 1
printf "\n\n  -> Configuring additional tools...\n\n"
sleep 1
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo apt install code -y
git clone https://github.com/ezaspy/oscybershop.git /home/ninja/Desktop/cybershop
# jupyter
pip install jupyterlab
pip install notebook
pip install voila
pip2 install jupyterlab
pip2 install notebook
pip2 install voila
# Bookstack
sudo git clone https://github.com/BookStackApp/BookStack.git /opt/bookstack
# DEFENSIVE CYBER
clear
sleep 1
printf "\n\n  -> Configuring 'Defensive Cyber' tools...\n\n"
sleep 1
sudo git clone https://github.com/ezaspy/bruce.git /opt/bruce
sudo git clone https://github.com/ezaspy/gandalf.git /opt/gandalf
# TZWorks
sudo mkdir /opt/TZWorks
sudo wget -O /opt/TZWorks/2022.10.19.win64.zip https://tzworks.com/prototypes/builds/2022.10.19.win64.zip
sudo wget -O /opt/TZWorks/2022.09.27.lin64.zip https://tzworks.com/prototypes/builds/2022.09.27.lin64.zip
sudo unzip /opt/TZWorks/2022.10.19.win64.zip -d /opt/TZWorks/2022.10.19.win64
sudo unzip /opt/TZWorks/2022.09.27.lin64.zip -d /opt/TZWorks/2022.09.27.lin64
# BlueTeamPowerShell
sudo mkdir /opt/BlueTeamPowerShell
sudo wget -O /opt/BlueTeamPowerShell.zip https://blueteampowershell.com/SEC505-Scripts.zip
sudo unzip -P 505 /opt/BlueTeamPowerShell.zip -d /opt/BlueTeamPowerShell
# SIGMA
sudo git clone https://github.com/SigmaHQ/sigma.git /opt/sigma
# DeepBlueCLI
sudo git clone https://github.com/sans-blue-team/DeepBlueCLI.git /opt/DeepBlueCLI
# KAPE
sudo git clone https://github.com/EricZimmerman/KapeFiles.git /opt/KAPE
# PowerForensics
sudo git clone https://github.com/Invoke-IR/PowerForensics.git /opt/PowerForensics
# MemProcFS
sudo git clone https://github.com/ufrisk/MemProcFS.git /opt/MemProcFS
# Sysmon
sudo mkdir -p /opt/Sysmon/SysmonForLinux
wget -O /opt/Sysmon.zip https://download.sysinternals.com/files/Sysmon.zip
sudo unzip /opt/Sysmon.zip -d /opt/Sysmon
sudo git clone https://github.com/Sysinternals/SysmonForLinux.git /opt/Sysmon/SysmonForLinux
# WmiExplorer
sudo git clone https://github.com/vinaypamnani/wmie2/ /opt/WMIExplorer
# CobaltStrike-Defence
sudo git clone https://github.com/MichaelKoczwara/Awesome-CobaltStrike-Defence /home/ninja/Desktop/CobaltStrike-Defence
sudo mkdir /home/ninja/Desktop/CobaltStrike-Defence/content
sudo chmod +x /opt/kasm/kasm/build/config/CobaltStrike-Defence.py
# OFFENSIVE CYBER
clear
sleep 1
printf "\n\n  -> Configuring 'Offensive Cyber' tools...\n\n"
sleep 1
# metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
sudo chmod 755 msfinstall
sudo ./msfinstall
# httrack
sudo git clone https://github.com/xroche/httrack.git --recurse /opt/httrack
cd /opt/httrack
sudo ./configure
sudo make -j8
sudo make install DESTDIR=/
cd ~
# THREAT INTELLIGENCE
clear
sleep 1
printf "\n\n  -> Configuring 'Threat Intelligence' tools...\n\n"
sleep 1
# Maltego
wget -O Maltego.v4.3.1.deb https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.1.deb
sudo dpkg -i Maltego.v4.3.1.deb
# freq
sudo git clone https://github.com/MarkBaggett/freq.git /opt/freq
# dnstwist
sudo git clone https://github.com/elceef/dnstwist.git /opt/dnstwist
# rdap
sudo git clone https://github.com/ezaspy/rdap.git /opt/rdap
# sherlock
sudo git clone https://github.com/sherlock-project/sherlock.git /opt/sherlock
# TweetScraper
sudo git clone https://github.com/jonbakerfish/TweetScraper.git /opt/TweetScraper
# karma
sudo git clone https://github.com/Dheerajmadhukar/karma_v2.git /opt/karma
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root
