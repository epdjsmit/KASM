#!/bin/bash
wget https://REMnux.org/remnux-cli
mv remnux-cli remnux
chmod +x remnux
sudo mv remnux /usr/local/bin
sudo apt install -y gnupg
sudo remnux install