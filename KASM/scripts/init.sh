mkdir /home/sansforensics/Desktop/Posters
mv /home/sansforensics/Desktop/*.pdf /home/sansforensics/Desktop/Posters
yes '' | sudo add-apt-repository ppa:mrazavi/gvm
sudo apt update
sudo apt-get install virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap postgresql gvm -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
sudo apt update
sudo python3 -m pip install --upgrade pip
sudo /tmp/KASM/KASM/scripts/./elrond.sh
printf "\n\n  -> KASM will install the remaining software automaically. Press ENTER to continue..."
read answer
sleep 1
clear
