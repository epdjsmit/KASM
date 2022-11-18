#!/bin/bash
# https://docs.strangebee.com/thehive/setup/installation/step-by-step-guide/
sudo apt install java-common java-11-amazon-corretto-jdk cassandra -y
sudo python3 /opt/kasm/kasm/build/install/thehive/cassandra.py
sudo systemctl start cassandra
sudo systemctl stop cassandra
sudo rm -rf /var/lib/cassandra/commitlog
sudo systemctl restart cassandra
cd /opt
wget https://archives.strangebee.com/zip/thehive-latest.zip
unzip thehive-latest.zip
sudo ln -s thehive-5.0.19-1 /opt/thehive
sudo addgroup thehive
sudo adduser --system thehive
sudo chown -R thehive:thehive /opt/thehive
sudo mkdir -p /opt/thehive/files
sudo mkdir -p /opt/thehive/conf
sudo touch /opt/thehive/conf/application.conf
sudo touch /opt/thehive/conf/secret.conf
sudo chown -R root:thehive /opt/thehive
sudo chgrp thehive /opt/thehive/conf/*.conf
sudo chmod 666 /opt/thehive/conf/*.conf
cd /tmp
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
	-Dconfig.file=/etc/thehive/conf/application.conf \
	-Dlogger.file=/etc/thehive/conf/logback.xml \
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
WantedBy=multi-user.target' > thehive.service
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
localfs.location = /opt/thehive/files
}

# Additional modules
#
# TheHive is strongly integrated with Cortex and MISP.
# Both modules are enabled by default. If not used, each one can be disabled by
# ommenting the configuration line.
scalligraph.modules += org.thp.thehive.connector.cortex.CortexModule
scalligraph.modules += org.thp.thehive.connector.misp.MispModule
' > /opt/thehive/conf/application.conf
cat > /opt/thehive/conf/secret.conf << _EOF_
play.http.secret.key="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)"
_EOF_
sudo mkdir /var/log/thehive
sudo chmod 640 /var/log/thehive/
sudo chown -R thehive:thehive /var/log/thehive/
sudo chmod 640 /opt/thehive/
sudo chown -R thehive:thehive /opt/thehive/
sudo systemctl enable thehive
sudo systemctl start thehive
cd ~