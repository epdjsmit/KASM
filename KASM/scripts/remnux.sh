#!/bin/bash
sleep 1
wget https://REMnux.org/remnux-cli
mv remnux-cli remnux
chmod +x remnux
sudo mv remnux /usr/local/bin
sudo remnux install
sleep 1