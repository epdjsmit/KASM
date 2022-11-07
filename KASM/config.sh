#!/bin/bash
sleep 1 && clear && sleep 1
sudo useradd -m -u 5276 -p $(openssl passwd -1 kasm) ninja && sudo usermod -aG sudo ninja
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

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
EOF
sudo rm -rf /etc/gdm3/custom.conf
sudo chmod 644 custom.conf && sudo mv custom.conf /etc/gdm3/custom.conf && sudo chown root:root /etc/gdm3/custom.conf
chmod 755 /tmp/KASM/KASM/scripts/init.sh && sudo cp /tmp/KASM/KASM/scripts/init.sh /etc/profile.d/ && chmod 775 /tmp/KASM/KASM/scripts/init.sh && sudo chown ninja:ninja /etc/profile.d/init.sh
sleep 1 && clear && sleep 1
sudo reboot