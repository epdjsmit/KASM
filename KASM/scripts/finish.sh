#!/bin/bash
sleep 1
sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh && sudo cp /tmp/KASM/KASM/images/KASM.png /usr/share/backgrounds/KASM.png && sudo echo "sudo /usr/bin/./theme.sh dot-gov" > set_theme_KASM.sh && sudo echo "gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/KASM.png'" >> set_theme_KASM.sh && chmod 644 set_theme_KASM.sh && sudo mv set_theme_KASM.sh /etc/profile.d/ && sudo chown root:root /etc/profile.d/set_theme_KASM.sh &&  gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'org.gnome.seahorse.Application.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'firefox.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'bless.desktop', 'wireshark.desktop', 'networkminer.desktop', 'cyberchef.desktop', 'die.desktop', 'jd-gui.desktop', 'ghidra.desktop', 'cutter.desktop', 'gnome-control-center.desktop']" && sleep 1 && sudo /usr/bin/./theme.sh dot-gov && gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/KASM.png
mkdir /home/sansforensics/Desktop/Posters && mv /home/sansforensics/Desktop/*.pdf /home/sansforensics/Desktop/Posters
sleep 1 && clear && sleep 1
printf "\n\n\n\n\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1 && clear && sleep 1
sudo reboot

#yes '' | sudo ./vmware-install.pl -f

#gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#EEEEEEEEECEC"
#gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000000000"
#OR
#sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh && echo "sudo /usr/bin/./theme.sh dot-gov" > /etc/profile.d/set_theme_KASM.sh && echo "gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/background.png'" > /etc/profile.d/set_theme_KASM.sh

#hostnamectl set-hostname KASM
#sudo useradd -m KASM
#sudo passwd KASM
#sleep 1
