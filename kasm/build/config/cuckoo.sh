#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring Cuckoo...\n\n"
sleep 1

sudo -H -u cuckoo bash -c 'virtualenv ~/cuckoo'
sudo -H -u cuckoo bash -c '. ~/cuckoo/bin/activate'
sudo -H -u cuckoo bash -c 'pip2 uninstall werkzeug -y'
sudo -H -u cuckoo bash -c 'pip2 install --no-cache-dir setuptools cryptography==2.9.2 pyrsistent==0.16.1 m2crypto==0.37.1 psycopg2 bottle cuckoo vmcloak werkzeug==0.16.1'
sudo -H -u cuckoo bash -c '/home/cuckoo/.local/bin/vmcloak init --verbose --win10x64 win7x10base --cpus 2 --ramsize 2048'
sudo -H -u cuckoo bash -c '/home/cuckoo/.local/bin/vmcloak clone win10x64base win10x64cuckoo'
sudo -H -u cuckoo bash -c '/home/cuckoo/.local/bin/vmcloak install win10x64cuckoo adobepdf pillow dotnet java flash vcredist vcredist.version=2015u3 wallpaper win7x64cuckoo ie11'
sudo -H -u cuckoo bash -c '/home/cuckoo/.local/bin/vmcloak snapshot --count 4 win10x64cuckoo cuckoo 192.168.56.101'
sudo -H -u cuckoo bash -c 'mv ~/.cuckoo/conf/ ~/.cuckoo/conf.old'
sudo -H -u cuckoo bash -c 'cp -R ~/conf ~/.cuckoo/conf'
sudo -H -u cuckoo bash -c 'rm -rf ~/conf'