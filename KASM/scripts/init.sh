#!/bin/bash
sudo curl -Lo /usr/bin/theme.sh 'https://git.io/JM70M' && sudo chmod +x /usr/bin/theme.sh && sudo cp /tmp/KASM/KASM/images/background.png /usr/share/backgrounds/KASM.png && sudo echo "sudo /usr/bin/./theme.sh dot-gov" > set_theme_KASM.sh && sudo echo "gsettings get org.gnome.desktop.background picture-uri 'file:///tmp/KASM/KASM/images/background.png'" >> set_theme_KASM.sh && chmod 644 set_theme_KASM.sh && sudo mv set_theme_KASM.sh /etc/profile.d/ && sudo chown root:root /etc/profile.d/set_theme_KASM.sh && sleep 1 && sudo /usr/bin/./theme.sh dot-gov && gsettings set org.gnome.desktop.background picture-uri file:////usr/share/backgrounds/KASM.png
mkdir /home/sansforensics/Desktop/Posters && mv /home/sansforensics/Desktop/*.pdf /home/sansforensics/Desktop/Posters
yes '' | sudo add-apt-repository ppa:mrazavi/gvm && clear && sudo apt update
/tmp/KASM/KASM/scripts/./virtualbox.sh && sleep 1
sudo apt-get install mlocate virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
python3 -m pip install --upgrade pip
sudo /tmp/KASM/KASM/scripts/./elrond.sh
sleep 1 && clear


#  - Configuring virtualbox-ext-pack<br>
#    - **TAB**<br>
#    - **&lt;Ok&gt;**<br>
#    - Do you accept the terms of the VirtualBox PUEL license?<br>
#      - **TAB**<br>
#      - **&lt;Yes&gt;**<br><br>

#sudo apt install postgresql

#sudo add-apt-repository ppa:mrazavi/gvm
#sudo apt install gvm

#sudo -u gvm -g gvm greenbone-nvt-sync
#sudo -u gvm -g gvm greenbone-feed-sync --type CERT
#sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
#sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA

#export $(sudo cat /etc/default/gvmd-pg)
#sudo -E -u gvm -g gvm gvmd --rebuild

#http://localhost:9392