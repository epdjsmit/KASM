#!/bin/bash
clear
sleep 1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo dpkg -i google-chrome-stable_current_amd64.deb && sudo rm -rf google-chrome-stable_current_amd64.deb
sudo snap install opera
sudo apt install torbrowser-launcher -y
torbrowser-launcher
sudosnap install sqlitebrowser
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
git clone https://github.com/ezaspy/oscybershop.git /home/ninja/Desktop/cybershop
pip install jupyterlab notebook voila
pip2 install jupyterlab notebook voila
sudo git clone https://github.com/BookStackApp/BookStack.git /opt/bookstack
sudo git clone https://github.com/ezaspy/bruce.git /opt/bruce
sudo git clone https://github.com/ezaspy/gandalf.git /opt/gandalf
sudo mkdir /opt/TZWorks
sudo wget -O /opt/TZWorks/2022.10.19.win64.zip https://tzworks.com/prototypes/builds/2022.10.19.win64.zip
sudo wget -O /opt/TZWorks/2022.09.27.lin64.zip https://tzworks.com/prototypes/builds/2022.09.27.lin64.zip
sudo unzip /opt/TZWorks/2022.10.19.win64.zip -d /opt/TZWorks/2022.10.19.win64
sudo unzip /opt/TZWorks/2022.09.27.lin64.zip -d /opt/TZWorks/2022.09.27.lin64
sudo mkdir /opt/BlueTeamPowerShell
sudo wget -O /opt/BlueTeamPowerShell.zip https://blueteampowershell.com/SEC505-Scripts.zip
sudo unzip -P 505 /opt/BlueTeamPowerShell.zip -d /opt/BlueTeamPowerShell
sudo git clone https://github.com/SigmaHQ/sigma.git /opt/sigma
sudo git clone https://github.com/sans-blue-team/DeepBlueCLI.git /opt/DeepBlueCLI
sudo git clone https://github.com/EricZimmerman/KapeFiles.git /opt/KAPE
sudo git clone https://github.com/Invoke-IR/PowerForensics.git /opt/PowerForensics
sudo git clone https://github.com/ufrisk/MemProcFS.git /opt/MemProcFS
sudo mkdir -p /opt/Sysmon/SysmonForLinux
wget -O /opt/Sysmon.zip https://download.sysinternals.com/files/Sysmon.zip
sudo unzip /opt/Sysmon.zip -d /opt/Sysmon
sudo git clone https://github.com/Sysinternals/SysmonForLinux.git /opt/Sysmon/SysmonForLinux
sudo git clone https://github.com/vinaypamnani/wmie2/ /opt/WMIExplorer
sudo git clone https://github.com/MichaelKoczwara/Awesome-CobaltStrike-Defence /home/ninja/Desktop/CobaltStrike-Defence
sudo mkdir /home/ninja/Desktop/CobaltStrike-Defence/content
sudo chmod +x /opt/kasm/kasm/build/install/CobaltStrike-Defence.py
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
sudo chmod 755 msfinstall
sudo ./msfinstall
sudo git clone https://github.com/xroche/httrack.git --recurse /opt/httrack
cd /opt/httrack
sudo ./configure
sudo make -j8
sudo make install DESTDIR=/
cd ~
wget -O Maltego.v4.3.1.deb https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.1.deb
sudo dpkg -i Maltego.v4.3.1.deb
sudo git clone https://github.com/MarkBaggett/freq.git /opt/freq
sudo git clone https://github.com/elceef/dnstwist.git /opt/dnstwist
sudo git clone https://github.com/ezaspy/rdap.git /opt/rdap
sudo git clone https://github.com/sherlock-project/sherlock.git /opt/sherlock
sudo git clone https://github.com/jonbakerfish/TweetScraper.git /opt/TweetScraper
sudo git clone https://github.com/Dheerajmadhukar/karma_v2.git /opt/karma
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root