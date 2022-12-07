#!/bin/bash
printf "    >> Installing Chrome Browser\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
sudo dpkg -i google-chrome-stable_current_amd64.deb > /dev/null 2>&1
sudo rm -rf google-chrome-stable_current_amd64.deb
printf "    >> Installing Opera Browser\n"
sudo snap install opera > /dev/null 2>&1
printf "    >> Installing DB Browser for SQLite\n"
sudo apt install sqlitebrowser xz-utils -y > /dev/null 2>&1
printf "    >> Installing Jupyter Notebooks\n"
pip install jupyterlab notebook voila > /dev/null 2>&1
pip2 install jupyterlab notebook voila > /dev/null 2>&1
####################################################################################################
#sudo apt install torbrowser-launcher -y
#sudo torbrowser-launcher
# OR
#sudo apt install flatpak -y
#sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#flatpak install flathub com.github.micahflee.torbrowser-launcher -y
####################################################################################################
printf "    >> Installing Azure CLI\n"
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash > /dev/null 2>&1
printf "    >> Installing AWS CLI\n"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" > /dev/null 2>&1
unzip awscliv2.zip > /dev/null 2>&1
sudo ./aws/install > /dev/null 2>&1
rm awscliv2.zip

printf "    >> Installing Bookstack\n"
sudo git clone https://github.com/BookStackApp/BookStack.git /opt/bookstack > /dev/null 2>&1

printf "    >> Downloading onestopcybershop\n"
git clone https://github.com/ezaspy/oscybershop.git /home/sansforensics/Desktop/cybershop > /dev/null 2>&1

sudo mkdir -p /opt/TZWorks /opt/BlueTeamPowerShell /opt/Sysmon/SysmonForLinux /home/sansforensics/Desktop/CobaltStrike-Defence/content
printf "    >> Downloading bruce\n"
sudo git clone https://github.com/ezaspy/bruce.git /opt/bruce > /dev/null 2>&1
printf "    >> Downloading gandalf\n"
sudo git clone https://github.com/ezaspy/gandalf.git /opt/gandalf > /dev/null 2>&1
printf "    >> Downloading SIGMA\n"
sudo git clone https://github.com/SigmaHQ/sigma.git /opt/sigma > /dev/null 2>&1
printf "    >> Downloading DeepBlueCLI\n"
sudo git clone https://github.com/sans-blue-team/DeepBlueCLI.git /opt/DeepBlueCLI > /dev/null 2>&1
printf "    >> Downloading KAPE\n"
sudo git clone https://github.com/EricZimmerman/KapeFiles.git /opt/KAPE > /dev/null 2>&1
printf "    >> Downloading PowerForensics\n"
sudo git clone https://github.com/Invoke-IR/PowerForensics.git /opt/PowerForensics > /dev/null 2>&1
printf "    >> Downloading MemProcFS\n"
sudo git clone https://github.com/ufrisk/MemProcFS.git /opt/MemProcFS > /dev/null 2>&1
printf "    >> Downloading WMIExplorer\n"
sudo git clone https://github.com/vinaypamnani/wmie2/ /opt/WMIExplorer > /dev/null 2>&1
printf "    >> Downloading CobaltStrike-Defence\n"
sudo git clone https://github.com/MichaelKoczwara/Awesome-CobaltStrike-Defence /home/sansforensics/Desktop/CobaltStrike-Defence > /dev/null 2>&1
sudo chmod +x /opt/kasm/kasm/build/install/CobaltStrike-Defence.py
printf "    >> Downloading freq\n"
sudo git clone https://github.com/MarkBaggett/freq.git /opt/freq > /dev/null 2>&1
printf "    >> Downloading dnstwist\n"
sudo git clone https://github.com/elceef/dnstwist.git /opt/dnstwist > /dev/null 2>&1
printf "    >> Downloading rdap\n"
sudo git clone https://github.com/ezaspy/rdap.git /opt/rdap > /dev/null 2>&1
printf "    >> Downloading sherlock\n"
sudo git clone https://github.com/sherlock-project/sherlock.git /opt/sherlock > /dev/null 2>&1
printf "    >> Downloading TweetScraper\n"
sudo git clone https://github.com/jonbakerfish/TweetScraper.git /opt/TweetScraper > /dev/null 2>&1
printf "    >> Downloading karma\n"
sudo git clone https://github.com/Dheerajmadhukar/karma_v2.git /opt/karma > /dev/null 2>&1

printf "    >> Downloading TZWorks\n"
sudo wget -O /opt/TZWorks/2022.10.19.win64.zip https://tzworks.com/prototypes/builds/2022.10.19.win64.zip > /dev/null 2>&1
sudo unzip /opt/TZWorks/2022.10.19.win64.zip -d /opt/TZWorks/2022.10.19.win64 > /dev/null 2>&1
sudo wget -O /opt/TZWorks/2022.09.27.lin64.zip https://tzworks.com/prototypes/builds/2022.09.27.lin64.zip > /dev/null 2>&1
sudo unzip /opt/TZWorks/2022.09.27.lin64.zip -d /opt/TZWorks/2022.09.27.lin64 > /dev/null 2>&1

printf "    >> Downloading BlueTeamPowerShell\n"
sudo wget -O /opt/BlueTeamPowerShell.zip https://blueteampowershell.com/SEC505-Scripts.zip > /dev/null 2>&1
sudo unzip -P 505 /opt/BlueTeamPowerShell.zip -d /opt/BlueTeamPowerShell > /dev/null 2>&1

printf "    >> Downloading Sysmon\n"
sudo wget -O /opt/Sysmon.zip https://download.sysinternals.com/files/Sysmon.zip > /dev/null 2>&1
sudo unzip /opt/Sysmon.zip -d /opt/Sysmon > /dev/null 2>&1
sudo git clone https://github.com/Sysinternals/SysmonForLinux.git /opt/Sysmon/SysmonForLinux > /dev/null 2>&1

printf "    >> Installing Metasploit\n"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall > /dev/null 2>&1
sudo chmod 755 msfinstall > /dev/null 2>&1
sudo ./msfinstall > /dev/null 2>&1

printf "    >> Installing HTTrack\n"
sudo git clone https://github.com/xroche/httrack.git --recurse /opt/httrack > /dev/null 2>&1
cd /opt/httrack
sudo ./configure > /dev/null 2>&1
sudo make -j8 > /dev/null 2>&1
sudo make install DESTDIR=/ > /dev/null 2>&1
cd ~

printf "    >> Installing Maltego\n"
wget -O Maltego.v4.3.1.deb https://maltego-downloads.s3.us-east-2.amazonaws.com/linux/Maltego.v4.3.1.deb > /dev/null 2>&1
sudo dpkg -i Maltego.v4.3.1.deb > /dev/null 2>&1
rm Maltego.v4.3.1.deb