#!/bin/bash
python3 -m pip install setuptools, viper-framework, cuckoo
mkdir /opt/cuckoo
chown cuckoo:cuckoo /opt/cuckoo
cuckoo --cwd /opt/cuckoo
export CUCKOO=/opt/cuckoo