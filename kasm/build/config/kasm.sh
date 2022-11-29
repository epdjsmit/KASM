#!/bin/bash
# applications to start upon logging in
sudo pg_ctlcluster 12 main start # gvm
/home/ninja/.local/bin/cuckoo web runserver # cuckoo