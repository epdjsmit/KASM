#!/bin/bash
clear
sleep 1
printf "\n\n  -> Configuring Greenbone...\n\n"
sleep 1
sudo apt install postgresql gvm libvirt-daemon -y --fix-missing
sudo -u gvm -g gvm greenbone-nvt-sync
sudo -u gvm -g gvm greenbone-feed-sync --type CERT
sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA
export $(sudo cat /etc/default/gvmd-pg)
sudo pg_ctlcluster 12 main start
sudo su -c "echo 3 >'/proc/sys/vm/drop_caches' && swapoff -a && swapon -a" root
sleep 10