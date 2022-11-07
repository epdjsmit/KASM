#!/bin/bash
sudo hostnamectl set-hostname kasm && sleep 1 && sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp && sleep 1 && sudo passwd temp echo 'sudo usermod -l ninja sansforensics && sudo chfn -f "ninja" ninja && sudo passwd ninja && sudo reboot' >> /home/temp/user.sh && sleep 1 && sudo chmod +x /home/temp/user.sh && sleep 1 && sudo reboot
