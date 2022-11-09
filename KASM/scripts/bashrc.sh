#!/bin/bash
sleep 1
sudo updatedb
# clean desktop & set background
mkdir /home/ninja/Desktop/Posters
mv /home/ninja/Desktop/*.pdf /home/ninja/Desktop/Posters
sudo rm -rf /usr/local/share/remnux/remnux-logo.png
sudo rm -rf /var/cache/remnux/cli/v2022.44.5/salt-states-2022.44.5/remnux/theme/gnome-config/remnux-logo.png
sudo cp /opt/KASM/KASM/images/KASM.png /usr/share/backgrounds/KASM.png
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/KASM.png
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
sudo chmod +x /opt/KASM/KASM/scripts/bashrc.py
python3 /opt/KASM/KASM/scripts/bashrc.py
sleep 1
sudo -E -u gvm -g gvm gvmd --rebuild #greenbone - http://localhost:9392
sleep 1
printf "\n\n\n\n\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1
sudo reboot