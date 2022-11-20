#!/bin/bash
# https://docs.strangebee.com/thehive/setup/installation/step-by-step-guide/
# cassandra
sudo apt install java-common java-11-amazon-corretto-jdk cassandra -y
sudo python3 /opt/kasm/kasm/build/install/thehive/cassandra.py
sudo systemctl start cassandra
sudo systemctl stop cassandra
sudo rm -rf /var/lib/cassandra/commitlog
sudo systemctl restart cassandra
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
# thehive
sudo mkdir -p /opt/thp/thehive/files
cd /opt
wget https://archives.strangebee.com/zip/thehive-latest.zip
unzip thehive-latest.zip
sudo ln -s thehive-5.0.19-1 thehive
sudo addgroup thehive
sudo adduser --system thehive
sudo mkdir /etc/thehive
sudo mkdir -p /opt/thehive/logs
sudo chmod 755 /opt/thehive
sudo chown -R thehive:thehive /opt/thehive
sudo chmod 640 /opt/thehive
sudo touch /opt/thehive-5.0.19-1/conf/application.conf
sudo chown -R root:thehive /etc/thehive
echo '[Unit]
Description=TheHive
Documentation=https://thehive-project.org
Wants=network-online.target
After=network-online.target

[Service]
WorkingDirectory=/opt/thehive

User=thehive
Group=thehive

ExecStart=/opt/thehive/bin/thehive \
	-Dconfig.file=/opt/thehive-5.0.19-1/conf/application.conf \
	-Dlogger.file=/etc/thehive/logback.xml \
	-Dpidfile.path=/dev/null

StandardOutput=null
StandardError=null

# Specifies the maximum file descriptor number that can be opened by this process
LimitNOFILE=65536

# Disable timeout logic and wait until process is stopped
TimeoutStopSec=0

# SIGTERM signal is used to stop the Java process
KillSignal=SIGTERM

# Java process is never killed
SendSIGKILL=no

# When a JVM receives a SIGTERM signal it exits with code 143
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
' > thehive.service
sudo cp thehive.service /etc/systemd/system/thehive.service
sudo echo '# Service configuration
application.baseUrl = "http://127.0.0.1:9000"
play.http.context = "/"

# Database and index configuration
# By default, TheHive is configured to connect to local Cassandra 4.x and a
# local Elasticsearch services without authentication.
db.janusgraph {
storage {
    backend = cql
    hostname = ["127.0.0.1"]
    # Cassandra authentication (if configured)
    # username = "thehive"
    # password = "password"
    cql {
    cluster-name = thp
    keyspace = thehive
    }
}
index.search {
    backend = elasticsearch
    hostname = ["127.0.0.1"]
    index-name = thehive
}
}

# Attachment storage configuration
# By default, TheHive is configured to store files locally in the folder.
# The path can be updated and should belong to the user/group running thehive service. (by default: thehive:thehive)
storage {
provider = localfs
localfs.location = /opt/thp/thehive/files
}

# Additional modules
#
# TheHive is strongly integrated with Cortex and MISP.
# Both modules are enabled by default. If not used, each one can be disabled by
# ommenting the configuration line.
scalligraph.modules += org.thp.thehive.connector.cortex.CortexModule
scalligraph.modules += org.thp.thehive.connector.misp.MispModule
' > /opt/thehive-5.0.19-1/conf/application.conf
sudo chgrp thehive /opt/thehive-5.0.19-1/conf/application.conf
sudo chmod 640 /opt/thehive-5.0.19-1/conf/application.conf
sudo touch /etc/thehive/secret.conf
sudo chmod 777 /etc/thehive/secret.conf
cat > /etc/thehive/secret.conf << _EOF_
play.http.secret.key="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)"
_EOF_
sudo chgrp thehive /etc/thehive/secret.conf
sudo chmod 640 /etc/thehive/secret.conf
sudo chown -R thehive:thehive /opt/thp/thehive
sudo chmod 640 /opt/thehive
sudo chown -R thehive:thehive /opt/thehive
sudo mkdir /var/log/thehive
sudo chmod 640 /var/log/thehive/
sudo chown -R thehive:thehive /var/log/thehive/
cd ~
sudo systemctl enable thehive
sudo systemctl start thehive
