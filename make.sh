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
sleep 2
echo "


##################################################
---- Welcome to the KASM configuration script ----
##################################################"
sleep 4
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##################################################
|    Please note the following:                  |
|      > Configuring KASM takes ~10 hours        |
|      > Ensure you have BUILD.md to hand        |
|      > Select the options as instructed        |
##################################################
"
sleep 4
echo "
    Press ENTER to begin...
"
read input
clear
sudo chmod +x /opt/kasm/kasm/build/*.*
sudo chmod +x /opt/kasm/kasm/build/install/*.*
/opt/kasm/kasm/build/./init.sh