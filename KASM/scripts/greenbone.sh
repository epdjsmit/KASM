#!/bin/bash
sleep 1
sudo greenbone-nvt-sync

sleep 1
sudo greenbone-scapdata-sync

sleep 1
sudo greenbone-certdata-sync

echo 'OPTIONS="--listen=0.0.0.0 --port=9392"' > /etc/default/gsad
sudo systemctl restart gsad
sleep 1