#!/bin/bash
sleep 1
sudo updatedb
# clean desktop & set background
mkdir /home/ninja/Desktop/Posters && mv /home/ninja/Desktop/*.pdf /home/ninja/Desktop/Posters
sudo rm -rf /usr/local/share/remnux/remnux-logo.png && sudo rm -rf /var/cache/remnux/cli/v2022.44.5/salt-states-2022.44.5/remnux/theme/gnome-config/remnux-logo.png
sudo cp /opt/kasm/kasm/images/kasm.png /usr/share/backgrounds/kasm.png && gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/kasm.png
sleep 1
# set icons
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'org.gnome.seahorse.Application.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'bless.desktop', 'wireshark.desktop', 'networkminer.desktop', 'cyberchef.desktop', 'die.desktop', 'jd-gui.desktop', 'ghidra.desktop', 'cutter.desktop', 'gnome-control-center.desktop']"
sleep 1
# set bash shell theme
sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M'
sudo chmod +x /usr/bin/theme.sh
/usr/bin/./theme.sh dracula
sleep 1
# configure .bashrc
sudo chmod +x /opt/kasm/kasm/build/bashrc.py
python3 /opt/kasm/kasm/build/bashrc.py
sleep 1
sudo -E -u gvm -g gvm gvmd --rebuild
libvirtd -d
sleep 1
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
sleep 1