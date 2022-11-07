#!/bin/bash
sudo useradd -s /bin/bash -d /home/temp/ -m -G sudo temp && sudo passwd temp
sudo reboot