#!/bin/bash
sudo userdel temp
sudo rm -rf /home/temp
sleep 2
clear
echo "
  ##########################################################
  ---- Commencing KASM-Workstation configuration script ----
  ##########################################################"
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ##########################################################
  |      Please note the following:                        |
  |          -> Configuring KASM takes ~10 hours           |
  |          -> Ensure you have BUILD.md to hand           |
  |          -> Select the options as instructed           |
  ##########################################################
"
printf "\n    >> Initialised KASM-Workstation\n    >> Created 'cuckoo' account\n\n    >> Installed apfs-fuse\n    >> Installed REMnux\n    >> Updated repositories\n    >> Installed Additional Tools\n    >> Installed Greenbone Vulnerability Manager\n    >> Uninstalled redundant software\n    >> Installed Chrome Browser\n    >> Installed Opera Browser\n    >> Installed DB Sqlite Browser\n    >> Installed Jupyter Notebooks\n    >> Installed Azure CLI\n    >> Installed AWS CLI\n    >> Installed Bookstack\n    >> Downloaded onestopcybershop\n    >> Downloaded bruce\n    >> Downloaded gandalf\n    >> Downloaded SIGMA\n    >> Downloaded DeepBlueCLI\n    >> Downloaded KAPE\n    >> Downloaded PowerForensics\n    >> Downloaded MemProcFS\n    >> Downloaded WMIExplorer\n    >> Downloaded CobaltStrike-Defence\n    >> Downloaded freq\n    >> Downloaded dnstwist\n    >> Downloaded rdap\n    >> Downloaded sherlock\n    >> Downloaded TweetScraper\n    >> Downloaded karma\n    >> Downloaded TZWorks\n    >> Downloaded BlueTeamPowerShell\n    >> Downloaded Sysmon\n    >> Installed Metasploit\n    >> Installed HTTrack\n    >> Installed Maltego\n    >> Disabled IPv6 Updates\n    >> Upgraded Python pip\n    >> Prepared elastic stack\n    >> Installed virtualisation software\n    >> Initialised elrond\n    >> Installed elrond\n    >> Created 'temp' account\n    >> Configured 'temp' account\n    >> Rebooted\n    >> Configuring 'ninja' account\n"

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
sudo -E -u gvm -g gvm gvmd --rebuild > /dev/null 2>&1
libvirtd -d > /dev/null 2>&1
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
sudo dpkg -i /opt/elrond/elrond/tools/.splunk.deb > /dev/null 2>&1
sudo /opt/splunk/bin/./splunk start --accept-license --answer-yes --no-prompt --seed-passwd kick-ass
sudo python3 /opt/kasm/kasm/build/install/navigator.py > /dev/null 2>&1
sudo python3 /opt/kasm/kasm/build/install/CobaltStrike-Defence.py > /dev/null 2>&1

# creating kick-ass.sh
echo "clear
sleep 2
python3 /opt/kasm/kasm/install/./kick-ass.py
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
sleep 10
sudo apt install python3-apt > /dev/null 2>&1
wget -O aptsources-cleanup.pyz https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.7.5.2/aptsources-cleanup.pyz > /dev/null 2>&1
chmod a+x aptsources-cleanup.pyz
sudo ./aptsources-cleanup.pyz -n > /dev/null 2>&1
sudo updatedb > /dev/null 2>&1
history -c
unset HISTFILE

sleep 2
clear
echo "
  ##########################################################
  ---- Commencing KASM-Workstation configuration script ----
  ##########################################################"
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ##########################################################
  |      Please note the following:                        |
  |          -> Configuring KASM takes ~10 hours           |
  |          -> Ensure you have BUILD.md to hand           |
  |          -> Select the options as instructed           |
  ##########################################################
"
printf "\n    >> Initialised KASM-Workstation\n    >> Created 'cuckoo' account\n\n    >> Installed apfs-fuse\n    >> Installed REMnux\n    >> Updated repositories\n    >> Installed Additional Tools\n    >> Installed Greenbone Vulnerability Manager\n    >> Uninstalled redundant software\n    >> Installed Chrome Browser\n    >> Installed Opera Browser\n    >> Installed DB Sqlite Browser\n    >> Installed Jupyter Notebooks\n    >> Installed Azure CLI\n    >> Installed AWS CLI\n    >> Installed Bookstack\n    >> Downloaded onestopcybershop\n    >> Downloaded bruce\n    >> Downloaded gandalf\n    >> Downloaded SIGMA\n    >> Downloaded DeepBlueCLI\n    >> Downloaded KAPE\n    >> Downloaded PowerForensics\n    >> Downloaded MemProcFS\n    >> Downloaded WMIExplorer\n    >> Downloaded CobaltStrike-Defence\n    >> Downloaded freq\n    >> Downloaded dnstwist\n    >> Downloaded rdap\n    >> Downloaded sherlock\n    >> Downloaded TweetScraper\n    >> Downloaded karma\n    >> Downloaded TZWorks\n    >> Downloaded BlueTeamPowerShell\n    >> Downloaded Sysmon\n    >> Installed Metasploit\n    >> Installed HTTrack\n    >> Installed Maltego\n    >> Disabled IPv6 Updates\n    >> Upgraded Python pip\n    >> Prepared elastic stack\n    >> Installed virtualisation software\n    >> Initialised elrond\n    >> Installed elrond\n    >> Created 'temp' account\n    >> Configured 'temp' account\n    >> Rebooted\n    >> Configured 'ninja' account\n      >> Success! KASM is fully configured\n\n"
sleep 4
echo "\n            Press ENTER to perform Final Reboot"
read input
sudo reboot