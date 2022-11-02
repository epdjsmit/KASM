mkdir /home/sansforensics/Desktop/Posters
mv /home/sansforensics/Desktop/*.pdf /home/sansforensics/Desktop/Posters
sudo apt update
yes '' | sudo add-apt-repository ppa:mrazavi/gvm
yes '' | sudo apt install postgresql gvm
sudo apt-get install virtualbox virtualbox-ext-pack virtualbox-qt net-tools nmap -y --fix-missing
sudo apt install systemd gnupg software-properties-common apt-transport-https wget -y --fix-missing
sudo apt update
sudo python3 -m pip install --upgrade pip
# installing and configuring elrond
sudo /tmp/KASM/KASM/scripts/./elrond.sh
# installing all other scripts
printf "\n\n  -> KASM will install the remaining software automaically. Press ENTER to continue..."
read answer
sleep 1
clear
