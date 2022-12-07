#!/bin/bash
commenced = clear + echo "
  ##########################################################
  ---- \033[1;33mCommenced KASM-Workstation configuration script\033[0m  ----
  ##########################################################"
banner = $commenced + echo "  \033[1;34m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\033[0m
  ##########################################################
  |      \033[1;33mPlease note the following:\033[0m                        |
  |          -> \033[1;33mConfiguring KASM takes ~10 hours\033[0m           |
  |          -> \033[1;33mEnsure you have BUILD.md to hand\033[0m           |
  |          -> \033[1;33mSelect the options as instructed\033[0m           |
  ##########################################################
"
# initialising temp account
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> \033[1;32mInstalled MISP\033[0m\n    >> \033[1;32mInstalled Greenbone Vulnerability Manager\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled virtualisation software\033[0m\n    >> \033[1;32mUpgraded Python pip\033[0m\n    >> \033[1;32mInstalled Jupyter Notebooks\033[0m\n    >> \033[1;32mInstalled Chrome Browser\033[0m\n    >> \033[1;32mInstalled Opera Browser\033[0m\n    >> \033[1;32mInstalled DB Browser for SQLite\033[0m\n    >> \033[1;32Installed Azure CLI\033[0m\n    >> \033[1;32mInstalled AWS CLI\033[0m\n    >> \033[1;32mInstalled Bookstack\033[0m    >> Downloaded onestopcybershop\033[0m\n    >> \033[1;32mDownloaded bruce\033[0m\n    >> \033[1;32mDownloaded gandalf\033[0m\n    >> \033[1;32mDownloaded SIGMA\033[0m\n    >> \033[1;32mDownloaded DeepBlueCLI\033[0m\n    >> \033[1;32mDownloaded KAPE\033[0m\n    >> \033[1;32mDownloaded PowerForensics\033[0m\n    >> \033[1;32mDownloaded MemProcFS\033[0m\n    >> \033[1;32mDownloaded WMIExplorer\033[0m\n    >> \033[1;32mDownloaded CobaltStrike-Defence\033[0m\n    >> \033[1;32mDownloaded freq\033[0m\n    >> \033[1;32mDownloaded dnstwist\033[0m\n    >> \033[1;32mDownloaded rdap\033[0m\n    >> \033[1;32mDownloaded sherlock\033[0m\n    >> \033[1;32mDownloaded TweetScraper\033[0m\n    >> \033[1;32mDownloaded karma\033[0m\n    >> \033[1;32mDownloaded TZWorks\033[0m\n    >> \033[1;32mDownloaded BlueTeamPowerShell\033[0m\n    >> \033[1;32mDownloaded Sysmon\033[0m\n    >> \033[1;32mInstalled Metasploit\033[0m\n    >> \033[1;32mInstalled HTTrack\033[0m\n    >> \033[1;32mInstalled Maltego\033[0m\n    >>  \033[1;32mInstalledelrond\n    >> Creating 'temp' account\n"
sudo hostnamectl set-hostname kasm > /dev/null 2>&1
hostname | (echo -n "127.0.0.1        " && cat) | sudo tee -a /etc/hosts > /dev/null 2>&1
sleep 1
sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp
sudo passwd temp
sleep 2
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> \033[1;32mInstalled MISP\033[0m\n    >> \033[1;32mInstalled Greenbone Vulnerability Manager\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled virtualisation software\033[0m\n    >> \033[1;32mUpgraded Python pip\033[0m\n    >> \033[1;32mInstalled Jupyter Notebooks\033[0m\n    >> \033[1;32mInstalled Chrome Browser\033[0m\n    >> \033[1;32mInstalled Opera Browser\033[0m\n    >> \033[1;32mInstalled DB Browser for SQLite\033[0m\n    >> \033[1;32Installed Azure CLI\033[0m\n    >> \033[1;32mInstalled AWS CLI\033[0m\n    >> \033[1;32mInstalled Bookstack\033[0m    >> Downloaded onestopcybershop\033[0m\n    >> \033[1;32mDownloaded bruce\033[0m\n    >> \033[1;32mDownloaded gandalf\033[0m\n    >> \033[1;32mDownloaded SIGMA\033[0m\n    >> \033[1;32mDownloaded DeepBlueCLI\033[0m\n    >> \033[1;32mDownloaded KAPE\033[0m\n    >> \033[1;32mDownloaded PowerForensics\033[0m\n    >> \033[1;32mDownloaded MemProcFS\033[0m\n    >> \033[1;32mDownloaded WMIExplorer\033[0m\n    >> \033[1;32mDownloaded CobaltStrike-Defence\033[0m\n    >> \033[1;32mDownloaded freq\033[0m\n    >> \033[1;32mDownloaded dnstwist\033[0m\n    >> \033[1;32mDownloaded rdap\033[0m\n    >> \033[1;32mDownloaded sherlock\033[0m\n    >> \033[1;32mDownloaded TweetScraper\033[0m\n    >> \033[1;32mDownloaded karma\033[0m\n    >> \033[1;32mDownloaded TZWorks\033[0m\n    >> \033[1;32mDownloaded BlueTeamPowerShell\033[0m\n    >> \033[1;32mDownloaded Sysmon\033[0m\n    >> \033[1;32mInstalled Metasploit\033[0m\n    >> \033[1;32mInstalled HTTrack\033[0m\n    >> \033[1;32mInstalled Maltego\033[0m\n    >>  \033[1;32mInstalledelrond\n    >> \033[1;32mCreated 'temp' account\n    >> Configuring 'temp' account\n"

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
$banner
printf "    >> \033[1;32mInitialised KASM-Workstation\033[0m\n    >> \033[1;32mCreated 'cuckoo' account\033[0m\n    >> \033[1;32mInstalled apfs-fuse\033[0m\n    >> \033[1;32mInstalled REMnux\033[0m\n    >> \033[1;32mUpdated repositories\033[0m\n    >> \033[1;32mInstalled Cuckoo Sandbox\033[0m\n    >> \033[1;32mInstalled TheHive\033[0m\n    >> \033[1;32mInstalled MISP\033[0m\n    >> \033[1;32mInstalled Greenbone Vulnerability Manager\033[0m\n    >> \033[1;32mUninstalled redundant software\033[0m\n    >> \033[1;32mInstalled virtualisation software\033[0m\n    >> \033[1;32mUpgraded Python pip\033[0m\n    >> \033[1;32mInstalled Jupyter Notebooks\033[0m\n    >> \033[1;32mInstalled Chrome Browser\033[0m\n    >> \033[1;32mInstalled Opera Browser\033[0m\n    >> \033[1;32mInstalled DB Browser for SQLite\033[0m\n    >> \033[1;32Installed Azure CLI\033[0m\n    >> \033[1;32mInstalled AWS CLI\033[0m\n    >> \033[1;32mInstalled Bookstack\033[0m    >> Downloaded onestopcybershop\033[0m\n    >> \033[1;32mDownloaded bruce\033[0m\n    >> \033[1;32mDownloaded gandalf\033[0m\n    >> \033[1;32mDownloaded SIGMA\033[0m\n    >> \033[1;32mDownloaded DeepBlueCLI\033[0m\n    >> \033[1;32mDownloaded KAPE\033[0m\n    >> \033[1;32mDownloaded PowerForensics\033[0m\n    >> \033[1;32mDownloaded MemProcFS\033[0m\n    >> \033[1;32mDownloaded WMIExplorer\033[0m\n    >> \033[1;32mDownloaded CobaltStrike-Defence\033[0m\n    >> \033[1;32mDownloaded freq\033[0m\n    >> \033[1;32mDownloaded dnstwist\033[0m\n    >> \033[1;32mDownloaded rdap\033[0m\n    >> \033[1;32mDownloaded sherlock\033[0m\n    >> \033[1;32mDownloaded TweetScraper\033[0m\n    >> \033[1;32mDownloaded karma\033[0m\n    >> \033[1;32mDownloaded TZWorks\033[0m\n    >> \033[1;32mDownloaded BlueTeamPowerShell\033[0m\n    >> \033[1;32mDownloaded Sysmon\033[0m\n    >> \033[1;32mInstalled Metasploit\033[0m\n    >> \033[1;32mInstalled HTTrack\033[0m\n    >> \033[1;32mInstalled Maltego\033[0m\n    >> \033[1;32mInstalled elrond\033[0m\n    >> \033[1;32mCreated 'temp' account\n    >> \033[1;32mConfigured 'temp' account\033[0m\n    >> Rebooting...\n"
sleep 10
sudo reboot