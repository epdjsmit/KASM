#!/bin/bash
# initial config
export PATH=$PATH:/usr/local/sbin
export INSTALL_PREFIX=/usr/local
export SOURCE_DIR=/home/gvm/source
sudo mkdir -p $SOURCE_DIR
export BUILD_DIR=/home/gvm/build
sudo mkdir -p $BUILD_DIR
export INSTALL_DIR=/home/gvm/install
sudo mkdir -p $INSTALL_DIR
sudo apt update
sudo apt install --no-install-recommends --assume-yes build-essential curl cmake pkg-config python3 python3-pip gnupg
sudo curl -f -L https://www.greenbone.net/GBCommunitySigningKey.asc -o /tmp/GBCommunitySigningKey.asc
gpg --import /tmp/GBCommunitySigningKey.asc
echo "8AE4BE429B60A59B311C2E739823FAA60ED1E580:6:" > /tmp/ownertrust.txt
gpg --import-ownertrust < /tmp/ownertrust.txt
sleep 1
#gvm-libs
sudo wget -O /opt/KASM/KASM/software/libpaho-mqtt1.3_1.3.8-1_amd64.deb "http://ftp.de.debian.org/debian/pool/main/p/paho.mqtt.c/libpaho-mqtt1.3_1.3.8-1_amd64.deb"
sudo wget -O /opt/KASM/KASM/software/libpaho-mqtt-dev_1.3.8-1_amd64.deb "http://ftp.de.debian.org/debian/pool/main/p/paho.mqtt.c/libpaho-mqtt-dev_1.3.8-1_amd64.deb"
sudo apt install -y libglib2.0-dev libgpgme-dev libgnutls28-dev uuid-dev libssh-gcrypt-dev libhiredis-dev libxml2-dev libpcap-dev libnet1-dev libldap2-dev libradcli-dev
sudo dpkg -i /opt/KASM/KASM/software/libpaho-mqtt1.3_1.3.8-1_amd64.deb
sudo dpkg -i /opt/KASM/KASM/software/libpaho-mqtt-dev_1.3.8-1_amd64.deb
sudo curl -f -L https://github.com/greenbone/gvm-libs/archive/refs/tags/v22.4.0.tar.gz -o $SOURCE_DIR/gvm-libs-22.4.0.tar.gz
sudo curl -f -L https://github.com/greenbone/gvm-libs/releases/download/v22.4.0/gvm-libs-22.4.0.tar.gz.asc -o $SOURCE_DIR/gvm-libs-22.4.0.tar.gz.asc
gpg --verify $SOURCE_DIR/gvm-libs-22.4.0.tar.gz.asc $SOURCE_DIR/gvm-libs-22.4.0.tar.gz
sudo tar -C $SOURCE_DIR -xvzf $SOURCE_DIR/gvm-libs-22.4.0.tar.gz
sudo mkdir -p $BUILD_DIR/gvm-libs
cd $BUILD_DIR/gvm-libs
sudo cmake $SOURCE_DIR/gvm-libs-22.4.0 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX -DCMAKE_BUILD_TYPE=Release -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var
sudo make -j$(nproc)
sudo make DESTDIR=$INSTALL_DIR install
sudo cp -rv $INSTALL_DIR/* /
sleep 1
# gvmd
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt install -y libglib2.0-dev libgnutls28-dev libpq-dev postgresql-server-dev-13 libical-dev xsltproc rsync libbsd-dev libgpgme-dev
sudo apt install -y --no-install-recommends texlive-latex-extra texlive-fonts-recommended xmlstarlet zip rpm fakeroot dpkg nsis gnupg gpgsm wget sshpass openssh-client socat snmp python3 smbclient python3-lxml gnutls-bin xml-twig-tools
sudo curl -f -L https://github.com/greenbone/gvmd/archive/refs/tags/v22.4.0.tar.gz -o $SOURCE_DIR/gvmd-22.4.0.tar.gz
sudo curl -f -L https://github.com/greenbone/gvmd/releases/download/v22.4.0/gvmd-22.4.0.tar.gz.asc -o $SOURCE_DIR/gvmd-22.4.0.tar.gz.asc
gpg --verify $SOURCE_DIR/gvmd-22.4.0.tar.gz.asc $SOURCE_DIR/gvmd-22.4.0.tar.gz
sudo tar -C $SOURCE_DIR -xvzf $SOURCE_DIR/gvmd-22.4.0.tar.gz
sudo mkdir -p $BUILD_DIR/gvmd
cd $BUILD_DIR/gvmd
sudo cmake $SOURCE_DIR/gvmd-22.4.0 -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX -DCMAKE_BUILD_TYPE=Release -DLOCALSTATEDIR=/var -DSYSCONFDIR=/etc -DGVM_DATA_DIR=/var -DGVMD_RUN_DIR=/run/gvmd -DOPENVAS_DEFAULT_SOCKET=/run/ospd/ospd-openvas.sock -DGVM_FEED_LOCK_PATH=/var/lib/gvm/feed-update.lock -DSYSTEMD_SERVICE_DIR=/lib/systemd/system -DLOGROTATE_DIR=/etc/logrotate.d
sudo make -j$(nproc)
sudo make DESTDIR=$INSTALL_DIR install
sudo cp -rv $INSTALL_DIR/* /
sleep 1
# pg-gvm
sudo apt install -y libglib2.0-dev postgresql-server-dev-13 libical-dev
sudo curl -f -L https://github.com/greenbone/pg-gvm/archive/refs/tags/v22.4.0.tar.gz -o $SOURCE_DIR/pg-gvm-22.4.0.tar.gz
sudo curl -f -L https://github.com/greenbone/pg-gvm/releases/download/v22.4.0/pg-gvm-22.4.0.tar.gz.asc -o $SOURCE_DIR/pg-gvm-22.4.0.tar.gz.asc
gpg --verify $SOURCE_DIR/pg-gvm-22.4.0.tar.gz.asc $SOURCE_DIR/pg-gvm-22.4.0.tar.gz
sudo tar -C $SOURCE_DIR -xvzf $SOURCE_DIR/pg-gvm-22.4.0.tar.gz
sudo mkdir -p $BUILD_DIR/pg-gvm
cd $BUILD_DIR/pg-gvm
sudo cmake $SOURCE_DIR/pg-gvm-22.4.0 -DCMAKE_BUILD_TYPE=Release
sudo make -j$(nproc)
sudo make DESTDIR=$INSTALL_DIR install
sudo cp -rv $INSTALL_DIR/* /
sleep 1
# gsa
export KEYRING=/usr/share/keyrings/nodesource.gpg
export DISTRIBUTION="$(lsb_release -s -c)"
sudo curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | sudo tee "$KEYRING" >/dev/null
gpg --no-default-keyring --keyring "$KEYRING" --list-keys
sudo echo "deb [signed-by=$KEYRING] https://deb.nodesource.com/node_14.x $DISTRIBUTION main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo echo "deb-src [signed-by=$KEYRING] https://deb.nodesource.com/node_14.x $DISTRIBUTION main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install -y nodejs
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo sudo apt update
sudo apt install -y yarn
sudo curl -f -L https://github.com/greenbone/gsa/archive/refs/tags/v22.4.0.tar.gz -o $SOURCE_DIR/gsa-22.4.0.tar.gz
sudo curl -f -L https://github.com/greenbone/gsa/releases/download/v22.4.0/gsa-22.4.0.tar.gz.asc -o $SOURCE_DIR/gsa-22.4.0.tar.gz.asc
gpg --verify $SOURCE_DIR/gsa-22.4.0.tar.gz.asc $SOURCE_DIR/gsa-22.4.0.tar.gz
sudo tar -C $SOURCE_DIR -xvzf $SOURCE_DIR/gsa-22.4.0.tar.gz
cd $SOURCE_DIR/gsa-22.4.0
rm -rf build
sleep 1
sudo yarn
