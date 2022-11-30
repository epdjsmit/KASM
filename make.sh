#!/bin/bash
while :; do
    case $1 in
        -c|--cuckoo) cuckoo="cuckoo";;
        -g|--greenbone) greenbone="greenbone";;
        -r|--remnux) remnux="remnux";;
        -t|--thehiveproject) thehiveproject="thp";;
        *) break
    esac
    shift
done
echo $cuckoo $greenbone $remnux $thehiveproject > .vars
clear
sudo chmod +x /opt/kasm/kasm/*.sh
sudo chmod +x /opt/kasm/kasm/build/*.*
sudo chmod +x /opt/kasm/kasm/build/install/*.*
/opt/kasm/kasm/build/./init.sh