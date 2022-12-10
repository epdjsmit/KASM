#!/bin/bash
install_or_skip=$(cat /home/sansforensics/.install_or_skip)

if [[ $install_or_skip = *Installed\ REMnux* ]]; then
  remnux_install_or_skip="\033[1;33mInstalled   REMnux\033[0m"
else
  remnux_install_or_skip="-- \033[1;30mSkipped     REMnux\033[0m"
fi

if [[ $install_or_skip = *Installed\ Cuckoo* ]]; then
  cuckoo_install_or_skip="\033[1;33mInstalled   Cuckoo Sandbox\033[0m"
else
  cuckoo_install_or_skip="-- \033[1;30mSkipped     Cuckoo Sandbox\033[0m"
fi

if [[ $install_or_skip = *Installed\ TheHive* ]]; then
  thehive_install_or_skip="\033[1;33mInstalled   TheHive\033[0m"
else
  thehive_install_or_skip="-- \033[1;30mSkipped     TheHive\033[0m"
fi

if [[ $install_or_skip = *Installed\ MISP* ]]; then
  misp_install_or_skip="\033[1;33mInstalled   MISP\033[0m"
else
  misp_install_or_skip="-- \033[1;30mSkipped     MISP\033[0m"
fi

if [[ $install_or_skip = *Installed\ Greenbone* ]]; then
  greenbone_install_or_skip="\033[1;33mInstalled   Greenbone Vulnerability Manager\033[0m"
else
  greenbone_install_or_skip="-- \033[1;30mSkipped     Greenbone Vulnerability Manager\033[0m"
fi


clear
printf "\n\n\n    $remnux_install_or_skip\n    >> \033[1;33mUpdated     repositories\033[0m\n    >> \033[1;33mRemoved     redundant software\033[0m\n    >> \033[1;33mInstalled   virtualisation engines\033[0m\n    >> \033[1;33mInstalled   Jupyter Notebooks\033[0m\n    >> \033[1;33mInstalled   Chrome Browser\033[0m\n    >> \033[1;33mInstalled   Opera Browser\033[0m\n    >> \033[1;33mInstalled   DB Browser for SQLite\033[0m\n    >> \033[1;33mInstalled   Azure CLI\033[0m\n    >> \033[1;33mInstalled   AWS CLI\033[0m\n    >> \033[1;33mInstalled   Bookstack\033[0m\n    >> \033[1;33mInstalled   elrond\033[0m\n    >> \033[1;33mDownloaded  additional tooling\033[0m\n      >> \033[1;34mDownloaded  onestopcybershop\033[0m\n      >> \033[1;34mDownloaded  gandalf\033[0m\n      >> \033[1;34mDownloaded  bruce\033[0m\n      >> \033[1;34mDownloaded  SIGMA\033[0m\n      >> \033[1;34mDownloaded  DeepBlueCLI\033[0m\n      >> \033[1;34mDownloaded  KAPE\033[0m\n      >> \033[1;34mDownloaded  PowerForensics\033[0m\n      >> \033[1;34mDownloaded  MemProcFS\033[0m\n      >> \033[1;34mDownloaded  WMIExplorer\033[0m\n      >> \033[1;34mDownloaded  CobaltStrike-Defence\033[0m\n      >> \033[1;34mDownloaded  freq\033[0m\n      >> \033[1;34mDownloaded  dnstwist\033[0m\n      >> \033[1;34mDownloaded  rdap\033[0m\n      >> \033[1;34mDownloaded  sherlock\033[0m\n      >> \033[1;34mDownloaded  TweetScraper\033[0m\n      >> \033[1;34mDownloaded  karma\033[0m\n      >> \033[1;34mDownloaded  TZWorks\033[0m\n      >> \033[1;34mDownloaded  BlueTeamPowerShell\033[0m\n      >> \033[1;34mDownloaded  Sysmon\033[0m\n    >> \033[1;33mInstalled   Metasploit\033[0m\n    >> \033[1;33mInstalled   HTTrack\033[0m\n    >> \033[1;33mInstalled   Maltego\033[0m\n    >> \033[1;32mInstalled   Splunk\033[0m\n    >> \033[1;32mInstalled   MITRE ATT&CK Navigator\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    $greenbone_install_or_skip\n    >> \033[1;31mRebooted\033[0m\n    <<  Configuring 'ninja' account\n"

sudo userdel temp
sudo rm -rf /home/temp
sleep 1
# clean desktop & set background & set icons
mkdir /home/ninja/Desktop/Posters
mv /home/ninja/Desktop/*.pdf /home/ninja/Desktop/Posters
sudo rm -rf /usr/local/share/remnux/remnux-logo.png
sudo rm -rf /var/cache/remnux/cli/v2022.44.5/salt-states-2022.44.5/remnux/theme/gnome-config/remnux-logo.png
sudo cp /opt/kasm/kasm/images/kasm.png /usr/share/backgrounds/kasm.png
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/kasm.png
gsettings set org.gnome.shell favorite-apps "['gnome-control-center.desktop', 'org.gnome.seahorse.Application.desktop', 'org.gnome.Todo.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'google-chrome.desktop', 'firefox.desktop', 'opera_opera.desktop', 'torbrowser.desktop', 'vmware-player.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'jupyter-notebook.desktop', 'bless.desktop', 'wireshark.desktop', 'networkminer.desktop', 'cyberchef.desktop', 'die.desktop', 'jd-gui.desktop', 'ghidra.desktop', 'cutter.desktop', 'edb.desktop', 'maltego.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28

# set bash shell theme
sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' > /dev/null 2>&1
sudo chmod +x /usr/bin/theme.sh
/usr/bin/./theme.sh dracula

# configure .bashrc
sudo chmod +x /opt/kasm/kasm/build/ninja.py
python3 /opt/kasm/kasm/build/ninja.py
echo "[Desktop Entry]
Type=Application
Exec=gnome-terminal
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_NG]=Terminal
Name=Terminal
Comment[en_NG]=Start Terminal On Startup
Comment=Start Terminal On Startup" > gnome-terminal.desktop
sudo rm -rf /home/ninja/.config/autostart/gnome-terminal.desktop
sudo mv gnome-terminal.desktop /home/ninja/.config/autostart/
sudo chmod 755 /home/ninja/.config/autostart/gnome-terminal.desktop
sudo chown -R ninja:ninja /opt/

# creating kick-ass.sh
echo "clear
sleep 2
python3 /opt/kasm/kasm/build/./kick-ass.py
sleep 20
sudo pg_ctlcluster 12 main start > /dev/null 2>&1
/home/ninja/.local/bin/cuckoo web runserver 127.0.0.1:8080 > /dev/null 2>&1
printf '\n\n      Press ENTER to continue...'
read answer
sleep 1
clear
sleep 1
cd /home/ninja/
" > /home/ninja/Desktop/kick-ass.sh
sudo chmod +x /home/ninja/Desktop/kick-ass.sh

# cleaning up and installing remaining software
clear
printf "\n\n\n    $remnux_install_or_skip\n    >> \033[1;33mUpdated     repositories\033[0m\n    >> \033[1;33mRemoved     redundant software\033[0m\n    >> \033[1;33mInstalled   virtualisation engines\033[0m\n    >> \033[1;33mInstalled   Jupyter Notebooks\033[0m\n    >> \033[1;33mInstalled   Chrome Browser\033[0m\n    >> \033[1;33mInstalled   Opera Browser\033[0m\n    >> \033[1;33mInstalled   DB Browser for SQLite\033[0m\n    >> \033[1;33mInstalled   Azure CLI\033[0m\n    >> \033[1;33mInstalled   AWS CLI\033[0m\n    >> \033[1;33mInstalled   Bookstack\033[0m\n    >> \033[1;33mInstalled   elrond\033[0m\n    >> \033[1;33mDownloaded  additional tooling\033[0m\n      >> \033[1;34mDownloaded  onestopcybershop\033[0m\n      >> \033[1;34mDownloaded  gandalf\033[0m\n      >> \033[1;34mDownloaded  bruce\033[0m\n      >> \033[1;34mDownloaded  SIGMA\033[0m\n      >> \033[1;34mDownloaded  DeepBlueCLI\033[0m\n      >> \033[1;34mDownloaded  KAPE\033[0m\n      >> \033[1;34mDownloaded  PowerForensics\033[0m\n      >> \033[1;34mDownloaded  MemProcFS\033[0m\n      >> \033[1;34mDownloaded  WMIExplorer\033[0m\n      >> \033[1;34mDownloaded  CobaltStrike-Defence\033[0m\n      >> \033[1;34mDownloaded  freq\033[0m\n      >> \033[1;34mDownloaded  dnstwist\033[0m\n      >> \033[1;34mDownloaded  rdap\033[0m\n      >> \033[1;34mDownloaded  sherlock\033[0m\n      >> \033[1;34mDownloaded  TweetScraper\033[0m\n      >> \033[1;34mDownloaded  karma\033[0m\n      >> \033[1;34mDownloaded  TZWorks\033[0m\n      >> \033[1;34mDownloaded  BlueTeamPowerShell\033[0m\n      >> \033[1;34mDownloaded  Sysmon\033[0m\n    >> \033[1;33mInstalled   Metasploit\033[0m\n    >> \033[1;33mInstalled   HTTrack\033[0m\n    >> \033[1;33mInstalled   Maltego\033[0m\n    >> \033[1;32mInstalled   Splunk\033[0m\n    >> \033[1;32mInstalled   MITRE ATT&CK Navigator\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    $greenbone_install_or_skip\n    >> \033[1;31mRebooted\033[0m\n    >> \033[1;33mConfigured 'ninja' account\033[0m\n    <<  Cleaning up\n"
sudo -E -u gvm -g gvm gvmd --rebuild > /dev/null 2>&1
libvirtd -d > /dev/null 2>&1
sudo python3 /opt/kasm/kasm/build/install/CobaltStrike-Defence.py > /dev/null 2>&1
wget -O aptsources-cleanup.pyz https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.7.5.2/aptsources-cleanup.pyz > /dev/null 2>&1
chmod a+x aptsources-cleanup.pyz
sudo ./aptsources-cleanup.pyz -n > /dev/null 2>&1
sudo updatedb > /dev/null 2>&1
history -c
unset HISTFILE

clear
printf "\n\n\n    $remnux_install_or_skip\n    >> \033[1;33mUpdated     repositories\033[0m\n    >> \033[1;33mRemoved     redundant software\033[0m\n    >> \033[1;33mInstalled   virtualisation engines\033[0m\n    >> \033[1;33mInstalled   Jupyter Notebooks\033[0m\n    >> \033[1;33mInstalled   Chrome Browser\033[0m\n    >> \033[1;33mInstalled   Opera Browser\033[0m\n    >> \033[1;33mInstalled   DB Browser for SQLite\033[0m\n    >> \033[1;33mInstalled   Azure CLI\033[0m\n    >> \033[1;33mInstalled   AWS CLI\033[0m\n    >> \033[1;33mInstalled   Bookstack\033[0m\n    >> \033[1;33mInstalled   elrond\033[0m\n    >> \033[1;33mDownloaded  additional tooling\033[0m\n      >> \033[1;34mDownloaded  onestopcybershop\033[0m\n      >> \033[1;34mDownloaded  gandalf\033[0m\n      >> \033[1;34mDownloaded  bruce\033[0m\n      >> \033[1;34mDownloaded  SIGMA\033[0m\n      >> \033[1;34mDownloaded  DeepBlueCLI\033[0m\n      >> \033[1;34mDownloaded  KAPE\033[0m\n      >> \033[1;34mDownloaded  PowerForensics\033[0m\n      >> \033[1;34mDownloaded  MemProcFS\033[0m\n      >> \033[1;34mDownloaded  WMIExplorer\033[0m\n      >> \033[1;34mDownloaded  CobaltStrike-Defence\033[0m\n      >> \033[1;34mDownloaded  freq\033[0m\n      >> \033[1;34mDownloaded  dnstwist\033[0m\n      >> \033[1;34mDownloaded  rdap\033[0m\n      >> \033[1;34mDownloaded  sherlock\033[0m\n      >> \033[1;34mDownloaded  TweetScraper\033[0m\n      >> \033[1;34mDownloaded  karma\033[0m\n      >> \033[1;34mDownloaded  TZWorks\033[0m\n      >> \033[1;34mDownloaded  BlueTeamPowerShell\033[0m\n      >> \033[1;34mDownloaded  Sysmon\033[0m\n    >> \033[1;33mInstalled   Metasploit\033[0m\n    >> \033[1;33mInstalled   HTTrack\033[0m\n    >> \033[1;33mInstalled   Maltego\033[0m\n    >> \033[1;32mInstalled   Splunk\033[0m\n    >> \033[1;32mInstalled   MITRE ATT&CK Navigator\033[0m\n    $cuckoo_install_or_skip\n    $thehive_install_or_skip\n    $misp_install_or_skip\n    $greenbone_install_or_skip\n    >> \033[1;31mRebooted\033[0m\n    >> \033[1;33mConfigured 'ninja' account\033[0m\n    >> \033[1;33mCleaned up\033[0m\n\n"
printf "\n
  ####################################################
  ----------- \033[1;32mSUCCESS! KASM is fully configured!\033[0m -----------
  ####################################################"
sleep 4
sudo rm -rf /home/sansforensics/.vars
sudo rm -rf /home/sansforensics/.install_or_skip
printf "\n            Press ENTER to perform final reboot\n\n"
read input
sudo reboot