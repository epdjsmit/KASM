#!/bin/bash
# https://docs.strangebee.com/thehive/setup/installation/step-by-step-guide/
# cassandra
sudo apt install java-common java-11-amazon-corretto-jdk cassandra -y
sudo python3 /opt/kasm/kasm/build/install/thehive/cassandra.py
sudo systemctl start cassandra
sudo systemctl stop cassandra
sudo rm -rf /var/lib/cassandra/commitlog
sudo systemctl start cassandra
# elastic
sudo chmod 777 /etc/elasticsearch/elasticsearch.yml
sudo python3 /opt/kasm/kasm/build/install/thehive/elastic.py
sudo chmod 660 /etc/elasticsearch/elasticsearch.yml
sudo chown root:elasticsearch /etc/elasticsearch/elasticsearch.yml
sudo touch /etc/elasticsearch/jvm.options.d/jvm.options
sudo chmod 777 /etc/elasticsearch/jvm.options.d/jvm.options
sudo python3 /opt/kasm/kasm/build/install/thehive/jvm.py
sudo chmod 660 /etc/elasticsearch/jvm.options.d/jvm.options
sudo chown root:elasticsearch /etc/elasticsearch/jvm.options.d/jvm.options
sudo systemctl start elasticsearch
# thehive
sudo mkdir -p /opt/thehive/files
sudo mkdir -p /opt/thehive/logs
# 1
cd /opt
wget https://archives.strangebee.com/zip/thehive-latest.zip
unzip thehive-latest.zip
sudo mv /opt/thehive-5.0.19-1/bin /opt/thehive
sudo mv /opt/thehive-5.0.19-1/conf /opt/thehive
sudo mv /opt/thehive-5.0.19-1/lib /opt/thehive
sudo mv /opt/thehive-5.0.19-1/LICENSE /opt/thehive
sudo rm -rf /opt/thehive-5.0.19-1
# 2
sudo addgroup thehive
sudo adduser --system thehive
sudo chown -R thehive:thehive /opt/thehive
sudo cp /opt/thehive/conf/application.conf /etc/thehive/
sudo cp /opt/thehive/conf/logback.xml /etc/thehive/
sudo mkdir /etc/thehive
sudo touch /etc/thehive/application.conf
sudo chown -R root:thehive /etc/thehive
sudo chgrp thehive /etc/thehive/application.conf
sudo chgrp thehive /etc/thehive/logback.xml
sudo chmod 777 /etc/thehive/application.conf
/opt/kasm/kasm/build/install/thehive/./application.sh
sudo chmod 640 /etc/thehive/application.conf
sudo chmod 640 /etc/thehive/logback.xml
sudo cp -r /opt/thehive/conf/logback.xml /etc/thehive
/opt/kasm/kasm/build/install/thehive/./service.sh
# secret.conf
sudo touch /etc/thehive/secret.conf
sudo chmod 777 /etc/thehive/secret.conf
cat > /etc/thehive/secret.conf << _EOF_
play.http.secret.key="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)"
_EOF_
# file storage
sudo mkdir -p /opt/thp/thehive/files
chown -R thehive:thehive /opt/thp/thehive/files
# service
sudo systemctl enable thehive
sudo systemctl start thehive

# permissions
#sudo chmod 640 /etc/thehive/application.conf
#sudo chgrp thehive /etc/thehive/secret.conf
#sudo chmod 640 /etc/thehive/secret.conf
#sudo chmod -R 640 /opt/thehive/
#sudo chown -R thehive:thehive /opt/thehive
# logging
#sudo mkdir /var/log/thehive
#sudo chmod 777 /var/log/thehive/
#sudo chown -R thehive:thehive /var/log/thehive/
#cd ~
#sudo rm -rf /opt/thehive-latest.zip
#sudo rm -rf /opt/thehive.service
