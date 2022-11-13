#!/bin/bash
# httrack
git clone https://github.com/xroche/httrack.git --recurse
cd httrack
./configure && make -j8 && make install DESTDIR=/
# Maltego
wget -O Maltego.v4.3.1.deb https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.1.deb
dpkg –i Maltego.v4.3.1.deb
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
# SIGMA
sudo git clone https://github.com/SigmaHQ/sigma.git /opt/sigma
# freq
sudo git clone https://github.com/MarkBaggett/freq.git /opt/freq
# DeepBlueCLI
sudo git clone https://github.com/sans-blue-team/DeepBlueCLI.git /opt/DeepBlueCLI
# KAPE
sudo git clone https://github.com/EricZimmerman/KapeFiles.git /opt/KAPE
# PowerForensics
sudo git clone https://github.com/Invoke-IR/PowerForensics.git /opt/PowerForensics
# MemProcFS
sudo git clone https://github.com/ufrisk/MemProcFS.git /opt/MemProcFS
# Sysmon
sudo git clone https://github.com/Sysinternals/SysmonForLinux.git /opt/Sysmon
# Bookstack
sudo git clone https://github.com/BookStackApp/BookStack.git /opt/Bookstack
# jupyter
pip install jupyterlab
pip install notebook
pip install voila
pip2 install jupyterlab
pip2 install notebook
pip2 install voila
####################-- UNFINISHED --####################
# CobaltStrike-Defence
sudo git clone https://github.com/MichaelKoczwara/Awesome-CobaltStrike-Defence /opt/CobaltStrike-Defence
# WmiExplorer
wget -O /opt/WmiExplorer_2.0.0.2.zip https://github.com/vinaypamnani/wmie2/releases/download/v2.0.0.2/unzip WmiExplorer_2.0.0.2.zip WmiExplorer
# Sysmon
wget -O /opt/Sysmon.zip https://download.sysinternals.com/files/Sysmon.zip
unzip /opt/Sysmon.zip /opt/Sysmon
# TZWorks
wget -O /opt/2022.10.19.win64.zip https://tzworks.com/prototypes/builds/2022.10.19.win64.zip
unzip /opt/2022.10.19.win64.zip /opt/TZWorks/2022.10.19.win64
wget -O /opt/2022.09.27.lin64.zip https://tzworks.com/prototypes/builds/2022.09.27.lin64.zip
unzip /opt/2022.09.27.lin64.zip /opt/TZWorks/2022.09.27.lin64
# SEC505
wget -O /opt/SEC505-Scripts.zip https://blueteampowershell.com/SEC505-Scripts.zip
unzip /opt/SEC505-Scripts.zip /opt/SEC505-Scripts
# Registry Viewer
wget -O /opt/RegistryViewer_1.8.0.5.exe http://marketing.accessdata.com/Registry%20Viewer_1.8.0.5.exe

#### Import oscybershop boorkmarks into Firefox ####
# wget -O /tmp/oscs_bookmarks.zip https://oscybershop.herokuapp.com/main/pages/content/oscs_bookmarks.zip
# unzip /tmp/oscs_bookmarks.zip /tmp/oscs_bookmarks