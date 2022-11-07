#!/bin/bash
sudo hostnamectl set-hostname kasm && sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp && sudo passwd temp echo 'sudo usermod -l ninja sansforensics && sudo chfn -f "ninja" ninja && sudo passwd ninja && sudo reboot' >> /home/temp/user.sh && sudo chmod +x /home/temp/user.sh && sudo reboot
