#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring Greenbone...\n\n"
sleep 1
sudo apt install postgresql gvm -y --fix-missing # DEBIAN_FRONTEND=noninteractive - sudo DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql
sudo -u gvm -g gvm greenbone-nvt-sync
sudo -u gvm -g gvm greenbone-feed-sync --type CERT
sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA
export $(sudo cat /etc/default/gvmd-pg)
# pg_ctlcluster 12 main start