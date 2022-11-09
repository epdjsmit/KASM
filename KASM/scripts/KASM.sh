#!/bin/bash
sleep 1
sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M'
sudo chmod +x /usr/bin/theme.sh
sudo cp /opt/KASM/KASM/images/KASM.png /usr/share/backgrounds/KASM.png
sudo echo "gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/KASM.png'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
/usr/bin/./theme.sh dot-gov" >> KASM_Theme.sh
chmod 755 KASM_Theme.sh
sudo mv KASM_Theme.sh /etc/profile.d/
sudo chown ninja:ninja /etc/profile.d/KASM_Theme.sh
sudo /usr/bin/./theme.sh dot-gov
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/KASM.png
mkdir /home/ninja/Desktop/Posters
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'org.gnome.seahorse.Application.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'bless.desktop', 'wireshark.desktop', 'networkminer.desktop', 'cyberchef.desktop', 'die.desktop', 'jd-gui.desktop', 'ghidra.desktop', 'cutter.desktop', 'gnome-control-center.desktop']"
sudo updatedb
printf "\n\n\n\n\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1
sudo reboot