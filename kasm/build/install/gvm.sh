#!/bin/bash
sudo apt install gvm postgresql -y --fix-missing
sudo -u gvm -g gvm greenbone-nvt-sync
sudo -u gvm -g gvm greenbone-feed-sync --type CERT
sudo -u gvm -g gvm greenbone-feed-sync --type SCAP
sudo -u gvm -g gvm greenbone-feed-sync --type GVMD_DATA
export $(sudo cat /etc/default/gvmd-pg)
