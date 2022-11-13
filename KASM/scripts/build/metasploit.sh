#!/bin/bash
# https://www.darkoperator.com/installing-metasploit-in-ubunt
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
sudo apt-get -y install oracle-java8-installer
sudo apt-get install build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev curl zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
RUBYVERSION=$(wget https://raw.githubusercontent.com/rapid7/metasploit-framework/master/.ruby-version -q -O - )
rvm install $RUBYVERSION
rvm use $RUBYVERSION --default
sudo git clone https://github.com/rapid7/metasploit-framework.git /opt/metasploit-framework
sudo chown -R `whoami` /opt/metasploit-framework
cd metasploit-framework
rvm --default use ruby-${RUBYVERSION}@metasploit-framework
gem install bundler
bundle install
sudo bash -c 'for MSF in $(ls msf*); do ln -s /opt/metasploit-framework/$MSF /usr/local/bin/$MSF;done'
echo "export PATH=$PATH:/usr/lib/postgresql/10/bin" >> ~/.bashrc
. ~/.bashrc 
sudo usermod -a -G postgres `whoami`
sudo su - `whoami`
cd /opt/metasploit-framework/
./msfdb init