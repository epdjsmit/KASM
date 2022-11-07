#!/bin/bash
sudo hostnamectl set-hostname kasm && sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp && sudo passwd temp && sudo reboot
# sudo usermod -l ninja sansforensics && sleep 1 && sudo chfn -f "ninja" ninja && sudo reboot