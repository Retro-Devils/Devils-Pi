#!/bin/bash 
function main_menu() 
{ local choice 
while true; do 
choice=$(dialog --backtitle "$BACKTITLE" --title "DIABLOS ARCADE UPDATER " \ 
--ok-label Select --cancel-label Exit \ 
--menu "V1.0 TO V1.1" 20 50 30 \ 
1 "Update Diablos Arcade " \ 
2 "View Changelog" \ 
2>&1 >/dev/tty) 

case "$choice" in 
1) update-da ;; 
2) changelog ;;
*) break ;; 
esac 
done
}

function update-da() {
clear
echo "----Backing Up & Getting New ES-Systems----"
sleep 2
sudo mv home/pi/.emuationstation/es-systems.cfg -f home/pi/.emuationstation/es-systems.cfg.backup
wget https://archive.org/download/devils-updates/es_systems.cfg -P home/pi/.emuationstation/

echo "----Getting Artwork----" 
sleep 2
wget https://archive.org/download/devils-updates/simpbowl.mp4 -P /home/pi/RetroPie/roms/arcade/snap/simpbowl.mp4

echo "----Removing Games-----"
sleep 2
sudo rm /home/pi/RetroPie/roms/Tekken.zip
sudo rm /home/pi/RetroPie/roms/Tekken2.zip
sudo rm /home/pi/RetroPie/roms/Tekken3.zip

echo "----Updating Devils Box----"
sleep 2
sudo rm /home/pi/RetroPie/retropiemenu/Devils-Box.sh 
cd /home/pi/Devils-Box || exit 
git pull -f 
cp /home/pi/Devils-Box/Devils-Box.sh -f /home/pi/RetroPie/retropiemenu/ 
sudo cp /home/pi/Devils-Box/files/box -f /usr/local/bin/ 
sudo cp /home/pi/Devils-Box/Devils-Box.sh -f /usr/local/bin/Devils-Box 
sudo chmod 755 /usr/local/bin/box sudo 
chmod 755 /usr/local/bin/Devils-Box 
chmod 755 /home/pi/RetroPie/retropiemenu/Devils-Box.sh 
sleep 1 
if [ -d /home/pi/RetroPie/retropiemenu/Devils-Box/" ]; then sudo rm -fR "$HOME"/RetroPie/retropiemenu/Devils-Box/; fi 
bash /home/pi/RetroPie/retropiemenu/Devils-Box.sh

echo "----Installing Devils Extra----"
sleep 2
curl -sSL https://git.io/J9Z8c | bash

echo "----Updating & Upgrading Now----" 
sleep 2
sudo apt -y update 
sudo apt -y upgrade
}

function changelog() {
dialog --sleep 1 --title "CHANGELOG" --msgbox "

-Added Wine support to Retropie Menu,

-Added missing Artwork.

-Devils Box Updated.

-Devils Extras Installed.

-Non working games removed. 

-Updated and Upgraded Debian Packages" 0 0
}



main-menu
