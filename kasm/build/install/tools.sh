#!/bin/bash
# GENERAL
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
# TZWorks
sudo mkdir /opt/TZWorks
sudo wget -O /opt/TZWorks/2022.10.19.win64.zip https://tzworks.com/prototypes/builds/2022.10.19.win64.zip
sudo unzip /opt/TZWorks/2022.10.19.win64.zip -d /opt/TZWorks/2022.10.19.win64
sudo wget -O /opt/TZWorks/2022.09.27.lin64.zip https://tzworks.com/prototypes/builds/2022.09.27.lin64.zip
sudo unzip /opt/TZWorks/2022.09.27.lin64.zip -d /opt/TZWorks/2022.09.27.lin64
# BlueTeamPowerShell
sudo mkdir /opt/BlueTeamPowerShell
sudo wget -O /opt/BlueTeamPowerShell.zip https://blueteampowershell.com/SEC505-Scripts.zip
sudo unzip /opt/BlueTeamPowerShell.zip -d /opt/BlueTeamPowerShell
# Registry Viewer
sudo mkdir /opt/RegistryViewer
sudo wget -O /opt/RegistryViewer/RegistryViewer_1.8.0.5.exe http://marketing.accessdata.com/Registry%20Viewer_1.8.0.5.exe
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
sudo python3 CobaltStrike-Defence.py
# OFFENSIVE CYBER
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
