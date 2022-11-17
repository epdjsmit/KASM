#!/bin/bash
python3 -m keyring --disable
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.session idle-delay 0
sudo chmod +x /opt/kasm/kasm/*.sh
sudo chmod +x /opt/kasm/kasm/build/*.*
sudo chmod +x /opt/kasm/kasm/build/install/*.*
sudo chmod +x /opt/kasm/kasm/build/install/thehive/*.*
sudo chmod +x /opt/kasm/kasm/build/config/*.*
/opt/kasm/kasm/build/./init.sh