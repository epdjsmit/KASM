#!/bin/bash
sudo adduser --system docker # thehive
sudo groupadd docker # thehive
sudo usermod -aG docker docker # thehive
sudo useradd -m -u 6477 -p $(openssl passwd -1 misp) misp # misp
sudo usermod -aG sudo misp # misp