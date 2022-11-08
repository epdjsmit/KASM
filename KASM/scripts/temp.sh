#!/bin/bash
sudo hostnamectl set-hostname kasm
clear
printf "\n  -> When prompted, please enter a password for the 'temp' account...\n"
sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp
sudo passwd temp
sleep 2
echo "sudo usermod -l ninja sansforensics # change username
sudo usermod -d /home/ninja -m ninja # change home folder
sudo chfn -f 'ninja' ninja # change 'name'
sudo groupmod --new-name ninja sansforensics # change group
sudo rm /home/ninja/.local/share/keyrings/login.keyring
#sudo find /home/ninja -type f -exec egrep -H '/home/sansforensics' {} \; | xargs sed -i 's%/home/sansforensics%/home/ninja/‌​;g'
clear
sleep 1" >> user.sh
echo "echo -e '\n\n  -> When prompted, please enter a password for the 'ninja' account...\n'" >> user.sh
echo "sudo passwd ninja # change password
gnome-session-quit --no-prompt" >> user.sh
sudo chmod +x user.sh
sudo mv user.sh /home/temp/user.sh