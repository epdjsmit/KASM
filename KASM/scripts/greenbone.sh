#!/bin/bash
printf "\n\n  -> Ready in configure and install greenbone..."
read answer
sleep 10782

sudo useradd -r -M -U -G sudo -s /usr/sbin/nologin gvm
sudo usermod -aG gvm $USER
sudo runuser -l gvm -c 'export PATH=$PATH:/usr/local/sbin'
sudo runuser -l gvm -c 'export INSTALL_PREFIX=/usr/local'
sudo runuser -l gvm -c 'export SOURCE_DIR=$HOME/source'
sudo runuser -l gvm -c 'mkdir -p $SOURCE_DIR'
sudo runuser -l gvm -c 'export BUILD_DIR=$HOME/build'
sudo runuser -l gvm -c 'mkdir -p $BUILD_DIR'
sudo runuser -l gvm -c 'export INSTALL_DIR=$HOME/install'
sudo runuser -l gvm -c 'mkdir -p $INSTALL_DIR'

sleep 1
sudo greenbone-scapdata-sync
sleep 1
sudo greenbone-certdata-sync
echo 'OPTIONS="--listen=0.0.0.0 --port=9392"' > /etc/default/gsad
sudo systemctl restart gsad
sleep 1
