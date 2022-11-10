#!/bin/bash
sudo hostnamectl set-hostname kasm
hostname | (echo -n "127.0.0.1        " && cat) | sudo tee -a /etc/hosts
clear
printf "\n  -> When prompted, please enter a password for the 'temp' account...\n"
sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp
sudo passwd temp
sleep 2
# autostarting user.sh upon login for temp account
echo "[Desktop Entry]
Type=Application
Exec=gnome-terminal -- /home/temp/./user.sh
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
sudo rm /home/ninja/.local/share/keyrings/login.keyring #sudo find /home/ninja -type f -exec egrep -H '/home/sansforensics' {} \; | xargs sed -i 's%/home/sansforensics%/home/ninja/‌​;g'
sleep 1
echo '[Desktop Entry]
Type=Application
Exec=gnome-terminal -- /home/ninja/./config.sh
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
sudo cp /opt/KASM/KASM/config.sh /home/ninja/config.sh
sudo chmod +x /home/ninja/config.sh
sleep 1
clear" > user.sh
echo "echo '\n\n  -> When prompted, please enter a password for the 'ninja' account...\n'" >> user.sh
echo "sudo passwd ninja # change password
sleep 1
gnome-session-quit --no-prompt" >> user.sh
sudo chmod +x user.sh
sudo mv user.sh /home/temp/user.sh