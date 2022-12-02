#!/bin/bash
sudo userdel temp
sudo rm -rf /home/temp
clear
sleep 1
printf "\n\n  -> Configuring ninja account...\n\n"
sleep 1
sudo updatedb
# clean desktop & set background
mkdir /home/ninja/Desktop/Posters
mv /home/ninja/Desktop/*.pdf /home/ninja/Desktop/Posters
sudo rm -rf /usr/local/share/remnux/remnux-logo.png
sudo rm -rf /var/cache/remnux/cli/v2022.44.5/salt-states-2022.44.5/remnux/theme/gnome-config/remnux-logo.png
sudo cp /opt/kasm/kasm/images/kasm.png /usr/share/backgrounds/kasm.png
gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/kasm.png
sleep 1
# set icons
gsettings set org.gnome.shell favorite-apps "['gnome-control-center.desktop', 'org.gnome.seahorse.Application.desktop', 'org.gnome.Todo.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Screenshot.desktop', 'google-chrome.desktop', 'firefox.desktop', 'opera_opera.desktop', 'torbrowser.desktop', 'vmware-player.desktop', 'org.gnome.Terminal.desktop', 'code.desktop', 'jupyter-notebook.desktop', 'bless.desktop', 'wireshark.desktop', 'networkminer.desktop', 'cyberchef.desktop', 'die.desktop', 'jd-gui.desktop', 'ghidra.desktop', 'cutter.desktop', 'edb.desktop', 'maltego.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
sleep 1
# set bash shell theme
sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M'
sudo chmod +x /usr/bin/theme.sh
/usr/bin/./theme.sh dracula
sleep 1
# configure .bashrc
sudo chmod +x /opt/kasm/kasm/build/ninja.py
python3 /opt/kasm/kasm/build/ninja.py
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
sudo chown -R ninja:ninja /opt/
sudo dpkg -i /opt/elrond/elrond/tools/.splunk-9.0.0.1-9e907cedecb1-linux-2.6-amd64.deb
sudo /opt/splunk/bin/./splunk start --accept-license --answer-yes --no-prompt --seed-passwd kasm
sudo python3 /opt/kasm/kasm/build/install/navigator.py
sudo python3 /opt/kasm/kasm/build/install/CobaltStrike-Defence.py
# cleaning repositories
sudo du -sh /var/cache/apt/archives
sudo apt-get remove --auto-remove --purge thunderbird rhythmbox yelp libreoffice* aisleriot gnome-mines gnome-sudoku gnome-mahjongg cheese ghex simple-scan -y
sudo apt-get autoremove --purge
sudo apt-get clean
# creating kick-ass.sh
echo "clear
sleep 2
python3 /opt/kasm/kasm/install/./kick-ass.py
sleep 20
sudo pg_ctlcluster 12 main start > /dev/null 2>&1 &
/home/ninja/.local/bin/cuckoo web runserver 127.0.0.1:8080 > /dev/null 2>&1 &
printf '\n\n  Press ENTER to continue...'
read answer
sleep 1
clear
sleep 1
cd /home/ninja/
" > /home/ninja/Desktop/kick-ass.sh
sudo chmod +x /home/ninja/Desktop/kick-ass.sh
sleep 10
sudo apt install python3-apt
wget -O aptsources-cleanup.pyz https://github.com/davidfoerster/aptsources-cleanup/releases/download/v0.1.7.5.2/aptsources-cleanup.pyz
chmod a+x aptsources-cleanup.pyz
sudo ./aptsources-cleanup.pyz -n
history -c
unset HISTFILE
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches'
swapoff -a
swapon -a" root
sudo reboot