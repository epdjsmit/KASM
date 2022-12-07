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
printf "\n    >> Initialising KASM-Workstation\n    >> Creating Cuckoo user\n\n    >> Installing apfs-fuse\n    >> Installing REMnux\n    >> Updating repositories\n    >> Installing Additional Tools\n    >> Installing Greenbone Vulnerability Manager\n    >> Uninstalling redundant software\n    >> Installing Chrome Browser\n    >> Installing Opera Browser\n    >> Installing DB Sqlite Browser\n    >> Installing Jupyter Notebooks\n    >> Installing Azure CLI\n    >> Installing AWS CLI\n    >> Installing Bookstack\n    >> Downloading onestopcybershop\n    >> Downloading bruce\n    >> Downloading gandalf\n    >> Downloading SIGMA\n    >> Downloading DeepBlueCLI\n    >> Downloading KAPE\n    >> Downloading PowerForensics\n    >> Downloading MemProcFS\n    >> Downloading WMIExplorer\n    >> Downloading CobaltStrike-Defence\n    >> Downloading freq\n    >> Downloading dnstwist\n    >> Downloading rdap\n    >> Downloading sherlock\n    >> Downloading TweetScraper\n    >> Downloading karma\n    >> Downloading TZWorks\n    >> Downloading BlueTeamPowerShell\n    >> Downloading Sysmon\n    >> Installing Metasploit\n    >> Installing HTTrack\n    >> Installing Maltego\n    >> Disabling IPv6 Updates\n    >> Upgrading Python pip\n    >> Preparing elastic stack\n    >> Installing virtualisation software\n    >> Initialising elrond\n    >> Installing elrond\n    >> Creating temp user\n    >> Configuring ninja user\n"

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
echo 'printf "    >> Creating ninja user\n"' >> temp.sh
echo "sudo passwd ninja # change password
sleep 1
gnome-session-quit --no-prompt" >> temp.sh
sudo chmod +x temp.sh
sudo mv temp.sh /home/temp/temp.sh
printf "\n\n    >> Rebooting...\n"
sleep 10
sudo reboot