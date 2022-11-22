#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring accounts...\n\n"
sleep 1
sudo adduser --system docker # thehive
sudo groupadd docker # thehive
sudo usermod -aG docker docker # thehive
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp # misp
sudo usermod -aG sudo misp # misp