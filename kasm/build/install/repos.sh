#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring repositories...\n\n"
sleep 1
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - # vscode
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" # vscode
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - # virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - # virtualbox
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" # virtualbox
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg # thehive
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null # thehive
yes '' | sudo add-apt-repository ppa:mrazavi/gvm # greenbone
sudo apt update