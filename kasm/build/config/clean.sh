#!/bin/bash
du -sh /var/cache/apt/archives
sudo apt-get clean
sudo apt-get autoremove --purge
sudo apt-get remove --purge rhythmbox libreoffice* -y
sudo apt-get remove --auto-remove aisleriot gnome-mines gnome-sudoku mahjongg ace-of-penguins gnomine gbrainy
sudo apt-get clean
sudo apt-get autoremove