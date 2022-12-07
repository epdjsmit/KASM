#!/bin/bash
# initialising temp account
printf "    >> Creating temp user\n"
sudo hostnamectl set-hostname kasm > /dev/null 2>&1
hostname | (echo -n "127.0.0.1        " && cat) | sudo tee -a /etc/hosts > /dev/null 2>&1
sleep 1
sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp
sudo passwd temp

sleep 2
clear
echo "
  ##########################################################
  ---- Commenced KASM-Workstation configuration script  ----
  ##########################################################"
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ##########################################################
  |      Please note the following:                        |
  |          -> Configuring KASM takes ~10 hours           |
  |          -> Ensure you have BUILD.md to hand           |
  |          -> Select the options as instructed           |
  ##########################################################
"
printf "\n    >> \033[0;32mInitialised KASM-Workstation\n    >> \033[0;32mCreated 'cuckoo' account\n    >> \033[0;32mInstalled apfs-fuse\n    >> \033[0;32mInstalled REMnux\n    >> \033[0;32mUpdated repositories\n    >> \033[0;32mInstalled Greenbone Vulnerability Manager\n    >> \033[0;32mConfigured Greenbone Vulnerability Manager\n    >> \033[0;32mUninstalled redundant software\n    >> \033[0;32mInstalled Chrome Browser\n    >> \033[0;32mInstalled Opera Browser\n    >> \033[0;32mInstalled DB Sqlite Browser\n    >> \033[0;32mInstalled Jupyter Notebooks\n    >> \033[0;32mInstalled Azure CLI\n    >> \033[0;32mInstalled AWS CLI\n    >> \033[0;32mInstalled Bookstack\n    >> \033[0;32mDownloaded onestopcybershop\n    >> \033[0;32mDownloaded bruce\n    >> \033[0;32mDownloaded gandalf\n    >> \033[0;32mDownloaded SIGMA\n    >> \033[0;32mDownloaded DeepBlueCLI\n    >> \033[0;32mDownloaded KAPE\n    >> \033[0;32mDownloaded PowerForensics\n    >> \033[0;32mDownloaded MemProcFS\n    >> \033[0;32mDownloaded WMIExplorer\n    >> \033[0;32mDownloaded CobaltStrike-Defence\n    >> \033[0;32mDownloaded freq\n    >> \033[0;32mDownloaded dnstwist\n    >> \033[0;32mDownloaded rdap\n    >> \033[0;32mDownloaded sherlock\n    >> \033[0;32mDownloaded TweetScraper\n    >> \033[0;32mDownloaded karma\n    >> \033[0;32mDownloaded TZWorks\n    >> \033[0;32mDownloaded BlueTeamPowerShell\n    >> \033[0;32mDownloaded Sysmon\n    >> \033[0;32mInstalled Metasploit\n    >> \033[0;32mInstalled HTTrack\n    >> \033[0;32mInstalled Maltego\n    >> \033[0;32mDisabled IPv6 Updates\n    >> \033[0;32mUpgraded Python pip\n    >> \033[0;32mPrepared elastic stack\n    >> \033[0;32mInstalled virtualisation software\n    >> \033[0;32mInitialised elrond\n    >> \033[0;32mInstalled elrond\n    >> \033[0;32mCreated 'temp' account\n    >> Configuring 'temp' account\n"

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
echo 'printf "    >> Creating ' >> temp.sh
echo "'ninja'" >> temp.sh
echo 'account\n"' >> temp.sh
echo "sudo passwd ninja
sleep 1
gnome-session-quit --no-prompt" >> temp.sh
sudo chmod +x temp.sh
sudo mv temp.sh /home/temp/temp.sh
sleep 2
clear
echo "
  ##########################################################
  ---- Commenced KASM-Workstation configuration script  ----
  ##########################################################"
echo "  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ##########################################################
  |      Please note the following:                        |
  |          -> Configuring KASM takes ~10 hours           |
  |          -> Ensure you have BUILD.md to hand           |
  |          -> Select the options as instructed           |
  ##########################################################
"
printf "\n    >> \033[0;32mInitialised KASM-Workstation\n    >> \033[0;32mCreated 'cuckoo' account\n    >> \033[0;32mInstalled apfs-fuse\n    >> \033[0;32mInstalled REMnux\n    >> \033[0;32mUpdated repositories\n    >> \033[0;32mInstalled Greenbone Vulnerability Manager\n    >> \033[0;32mConfigured Greenbone Vulnerability Manager\n    >> \033[0;32mUninstalled redundant software\n    >> \033[0;32mInstalled Chrome Browser\n    >> \033[0;32mInstalled Opera Browser\n    >> \033[0;32mInstalled DB Sqlite Browser\n    >> \033[0;32mInstalled Jupyter Notebooks\n    >> \033[0;32mInstalled Azure CLI\n    >> \033[0;32mInstalled AWS CLI\n    >> \033[0;32mInstalled Bookstack\n    >> \033[0;32mDownloaded onestopcybershop\n    >> \033[0;32mDownloaded bruce\n    >> \033[0;32mDownloaded gandalf\n    >> \033[0;32mDownloaded SIGMA\n    >> \033[0;32mDownloaded DeepBlueCLI\n    >> \033[0;32mDownloaded KAPE\n    >> \033[0;32mDownloaded PowerForensics\n    >> \033[0;32mDownloaded MemProcFS\n    >> \033[0;32mDownloaded WMIExplorer\n    >> \033[0;32mDownloaded CobaltStrike-Defence\n    >> \033[0;32mDownloaded freq\n    >> \033[0;32mDownloaded dnstwist\n    >> \033[0;32mDownloaded rdap\n    >> \033[0;32mDownloaded sherlock\n    >> \033[0;32mDownloaded TweetScraper\n    >> \033[0;32mDownloaded karma\n    >> \033[0;32mDownloaded TZWorks\n    >> \033[0;32mDownloaded BlueTeamPowerShell\n    >> \033[0;32mDownloaded Sysmon\n    >> \033[0;32mInstalled Metasploit\n    >> \033[0;32mInstalled HTTrack\n    >> \033[0;32mInstalled Maltego\n    >> \033[0;32mDisabled IPv6 Updates\n    >> \033[0;32mUpgraded Python pip\n    >> \033[0;32mPrepared elastic stack\n    >> \033[0;32mInstalled virtualisation software\n    >> \033[0;32mInitialised elrond\n    >> \033[0;32mInstalled elrond\n    >> \033[0;32mCreated 'temp' account\n    >> \033[0;32mConfigured 'temp' account\n    >> Rebooting\n"
sleep 10
sudo reboot