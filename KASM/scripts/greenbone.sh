#!/bin/bash
sudo apt update && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt install -y software-properties-common && sudo apt install -y build-essential cmake pkg-config libglib2.0-dev libjson-glib-dev libgpgme-dev libgnutls28-dev uuid-dev libssh-gcrypt-dev libldap2-dev doxygen graphviz libradcli-dev libhiredis-dev libpcap-dev bison libksba-dev libsnmp-dev gcc-mingw-w64 heimdal-dev libpopt-dev xmltoman redis-server xsltproc libical-dev gvm postgresql postgresql-contrib postgresql-server-dev-all gnutls-bin nmap rpm nsis curl wget fakeroot gnupg sshpass socat snmp smbclient libmicrohttpd-dev libxml2-dev python3-polib gettext rsync xml-twig-tools python3-paramiko python3-lxml python3-defusedxml python3-pip python3-psutil python3-impacket virtualenv vim git && sudo apt install -y texlive-latex-extra --no-install-recommends && sudo apt install -y texlive-fonts-recommended && sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && sudo echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt update && sudo apt -y install yarn && sudo yarn install && sudo yarn upgrade
sudo echo 'export PATH="$PATH:/opt/gvm/bin:/opt/gvm/sbin:/opt/gvm/.local/bin"' | sudo tee -a /etc/profile.d/gvm.sh && sudo chmod 0755 /etc/profile.d/gvm.sh && source /etc/profile.d/gvm.sh && sudo bash -c 'cat << EOF > /etc/ld.so.conf.d/gvm.conf
# gmv libs location
/opt/gvm/lib
EOF'
sudo mkdir /opt/gvm && sudo adduser gvm --disabled-password --home /opt/gvm/ --no-create-home --gecos '' && sudo usermod -aG redis gvm && sudo chown gvm:gvm /opt/gvm/
# as gvm
# pkg-config --cflags json-glib-1.0
sudo runuser -l gvm -c 'mkdir src && cd src && export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH'
sudo runuser -l gvm -c 'git clone https://github.com/greenbone/gvm-libs.git && git clone https://github.com/greenbone/openvas.git && git clone https://github.com/greenbone/gvmd.git && git clone https://github.com/greenbone/openvas-smb.git && git clone https://github.com/greenbone/gsa.git && git clone https://github.com/greenbone/ospd-openvas.git && git clone https://github.com/greenbone/ospd.git'
sudo runuser -l gvm -c 'cd gvm-libs && export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm .. && make && make doc && make install && cd /opt/gvm/src'
sudo runuser -l gvm -c 'cd openvas-smb && export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH && mkdir build && cd build/ && cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm .. && make && make install && cd /opt/gvm/src'
sudo runuser -l gvm -c 'cd openvas && export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH && mkdir build && cd build/ && cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm .. && make && make doc && make install && cd /opt/gvm/src'
sleep 10000
# as root
export LC_ALL="C" && ldconfig && cp /etc/redis/redis.conf /etc/redis/redis.orig && cp /opt/gvm/src/openvas/config/redis-openvas.conf /etc/redis/ && chown redis:redis /etc/redis/redis-openvas.conf && echo "db_address = /run/redis-openvas/redis.sock" > /opt/gvm/etc/openvas/openvas.conf && systemctl enable redis-server@openvas.service && systemctl start redis-server@openvas.service
sysctl -w net.core.somaxconn=1024 && sysctl vm.overcommit_memory=1 && echo "net.core.somaxconn=1024"  >> /etc/sysctl.conf && echo "vm.overcommit_memory=1" >> /etc/sysctl.conf
cat << EOF > /etc/systemd/system/disable-thp.service
[Unit]
Description=Disable Transparent Huge Pages (THP)

[Service]
Type=simple
ExecStart=/bin/sh -c "echo 'never' > /sys/kernel/mm/transparent_hugepage/enabled && echo 'never' > /sys/kernel/mm/transparent_hugepage/defrag"

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload && systemctl start disable-thp && systemctl enable disable-thp && systemctl restart redis-server
sed 's/Defaults\s.*secure_path=\"\/usr\/local\/sbin:\/usr\/local\/bin:\/usr\/sbin:\/usr\/bin:\/sbin:\/bin:\/snap\/bin\"/Defaults secure_path=\"\/usr\/local\/sbin:\/usr\/local\/bin:\/usr\/sbin:\/usr\/bin:\/sbin:\/bin:\/snap\/bin:\/opt\/gvm\/sbin\"/g' /etc/sudoers | EDITOR='tee' visudo
echo "gvm ALL = NOPASSWD: /opt/gvm/sbin/openvas" > /etc/sudoers.d/gvm
echo "gvm ALL = NOPASSWD: /opt/gvm/sbin/gsad" >> /etc/sudoers.d/gvm
sleep 1
sudo greenbone-nvt-sync
sudo openvas -u
cd gvmd && export PKG_CONFIG_PATH=/opt/gvm/lib/pkgconfig:$PKG_CONFIG_PATH && mkdir build && cd build/ && cmake -DCMAKE_INSTALL_PREFIX=/opt/gvm .. && make && make doc && make install && cd /opt/gvm/src

sudo -u postgres bash
export LC_ALL="C"
createuser -DRS gvm
createdb -O gvm gvmd

psql gvmd
create role dba with superuser noinherit;
grant dba to gvm;
create extension "uuid-ossp";
create extension "pgcrypto";
exit
exit



gvm-manage-certs -a
gvmd --create-user=admin --password=admin
gvmd --get-users --verbose




sleep 1
sudo greenbone-scapdata-sync
sleep 1
sudo greenbone-certdata-sync
echo 'OPTIONS="--listen=0.0.0.0 --port=9392"' > /etc/default/gsad
sudo systemctl restart gsad
sleep 1
