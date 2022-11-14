#!/bin/bash
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - # vscode
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" # vscode
yes '' | sudo add-apt-repository ppa~mrazavi/gvm # greenbone

sudo apt update
