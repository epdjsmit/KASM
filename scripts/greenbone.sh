#!/bin/bash
add-apt-repository ppa:mrazavi/gvm && 
apt-get update -y && apt-get upgrade -y && apt-get install net-tools gparted postgresql gvm openjdk-11-jdk elasticsearch kibana logstash -y
greenbone-nvt-sync
sudo su
greenbone-scapdata-sync
greenbone-certdata-sync
echo 'OPTIONS="--listen=0.0.0.0 --port=9392"' > /etc/default/gsad
systemctl restart gsad