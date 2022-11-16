#!/bin/bash
# clear && sudo rm -rf /opt/KASM/ && sudo rm -rf /opt/kasm/ && sudo git clone https://github.com/ezaspy/KASM.git /opt/kasm && sudo /opt/kasm/kasm/build/install/thehive/./hive.sh
sudo apt install java-common java-11-amazon-corretto-jdk cassandra -y
sudo python3 /opt/kasm/kasm/build/install/thehive/cassandra.py
sudo systemctl start cassandra
sudo systemctl stop cassandra
sudo rm -rf /var/lib/cassandra/commitlog
sudo systemctl restart cassandra
sleep 180
for TABLE in edgestore edgestore_lock_ graphindex graphindex_lock_ janusgraph_ids system_properties system_properties_lock_ systemlog txlog
    do
    cqlsh -u cassandra -p cassandra -e "ALTER TABLE thehive.${TABLE} WITH gc_grace_seconds = 0;"
    done
sudo mkdir -p /opt/thp/thehive/files
sudo addgroup thehive
sudo adduser --system thehive
sudo chown -R thehive:thehive /opt/thp/thehive/files
unzip /opt/kasm/kasm/build/software/thehive-latest.zip -d /opt/
sudo ln -s thehive-5.0.19-1 thehive
sudo addgroup thehive
sudo adduser --system thehive
sudo chown -R thehive:thehive /opt/thehive
sudo mkdir /etc/thehive
sudo touch /etc/thehive/application.conf
sudo touch /etc/thehive/secret.conf
sudo chown root:thehive /etc/thehive
sudo chgrp thehive /etc/thehive/application.conf
sudo chgrp thehive /etc/thehive/secret.conf
sudo chmod 666 /etc/thehive/application.conf
sudo chmod 666 /etc/thehive/secret.conf
sudo cp /opt/kasm/kasm/build/software/thehive.service /etc/systemd/system/thehive.service
sudo echo '# Service configuration
application.baseUrl = "http://localhost:9000"
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
' > /etc/thehive/application.conf

cat > /etc/thehive/secret.conf << _EOF_
play.http.secret.key="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)"
_EOF_
sudo chmod 640 /etc/thehive/*.conf
sudo chown -R thehive:thehive /opt/thp/thehive/files
sudo systemctl enable thehive
sudo systemctl start thehive
