#!/bin/bash
sleep 1 && clear && sleep 1
hostnamectl set-hostname kasm
sudo useradd -s /bin/bash -d /home/ninja/ -m -G sudo ninja && sudo passwd ninja
sudo cat << EOF > custom.conf
# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncomment the line below to force the login screen to use Xorg
#WaylandEnable=false

# Enabling automatic login
AutomaticLogonEnable = true
AutomaticLogin = ninja

# Enabling time login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]

[xdmcp]

[greeter]
IncludeAll=false
Include=ninja

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
EOF
sudo rm -rf /etc/gdm3/custom.conf && sudo chmod 644 custom.conf && sudo mv custom.conf /etc/gdm3/custom.conf && sudo chown root:root /etc/gdm3/custom.conf
#sudo echo "bash /tmp/KASM/KASM/scripts/./init.sh" >> /home/ninja/.bashrc
sudo cp /tmp/KASM/KASM/scripts/init.sh /etc/profile.d/
sudo mv /etc/profile.d/init.sh /etc/profile.d/KASM.sh
chmod 644 /etc/profile.d/KASM.sh
chmod +x /etc/profile.d/KASM.sh
sleep 1 && clear && sleep 1
sudo reboot