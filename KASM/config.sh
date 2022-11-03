#!/bin/bash
sleep 1
clear
/tmp/KASM/KASM/scripts/./init.sh
/tmp/KASM/KASM/scripts/./code.sh
/tmp/KASM/KASM/scripts/./greenbone.sh # dev
##/tmp/KASM/KASM/scripts/./cuckoo.sh
#/tmp/KASM/KASM/scripts/./remnux.sh
##/tmp/KASM/KASM/scripts/./hive.sh
#/tmp/KASM/KASM/scripts/./misp.sh
sleep 1
hostnamectl set-hostname KASM
sudo useradd -m KASM
sudo passwd KASM
sleep 1
mv /home/sansforensics/Desktop/Posters /home/KASM/Desktop/
gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/background.png'
printf "\n\n  -> KASM has been successfully configured. Press ENTER to reboot..."
read answer
sleep 1 && clear && sleep 1
sudo reboot

# yes '' | sudo ./vmware-install.pl -f

#gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#EEEEEEEEECEC"
#gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000000000"
#OR
#sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh
#if command -v theme.sh > /dev/null; then
#	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"
#	# Optional
#	#Binds C-o to the previously active theme.
#	bind -x '"\C-o":"theme.sh $(theme.sh -l|tail -n2|head -n1)"'
#	alias th='theme.sh -i'
#	# Interactively load a light theme

#	alias thl='theme.sh --light -i'
#	# Interactively load a dark theme
#	alias thd='theme.sh --dark -i'
#fi