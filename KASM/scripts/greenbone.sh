#!/bin/bash
add-apt-repository ppa:mrazavi/gvm
apt-get install net-tools postgresql gvm -y --fix-missing
greenbone-nvt-sync
sleep 1
greenbone-scapdata-sync
sleep 1
greenbone-certdata-sync
echo 'OPTIONS="--listen=0.0.0.0 --port=9392"' > /etc/default/gsad
systemctl restart gsad