#!/bin/bash
# application.conf
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
# commenting the configuration line.
#scalligraph.modules += org.thp.thehive.connector.cortex.CortexModule
#scalligraph.modules += org.thp.thehive.connector.misp.MispModule
' > /etc/thehive/application.conf
