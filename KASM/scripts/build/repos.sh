#!/bin/bash
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - # vscode
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" # vscode
yes '' | sudo add-apt-repository ppa~mrazavi/gvm # greenbone
sudo add-apt-repository universe # virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - # virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - # virtualbox
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" # virtualbox

sudo apt update
