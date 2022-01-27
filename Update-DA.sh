#!/bin/bash 
function main_menu() 
{ local choice 
while true; do 
choice=$(dialog --backtitle "$BACKTITLE" --title "DIABLOS ARCADE UPDATER " \ 
--ok-label Select --cancel-label Exit \ 
--menu "VERSION 1.0" 20 50 30 \ 
1 "Update  " \ 
2 "View Changelog" \ 
2>&1 >/dev/tty) 

case "$choice" in 
1) da-update  ;; 
2) changelog ;;
*) break ;; 
esac 
done
}

function da-update() {
clear
echo "Backing Up & Getting New ES-Systems"
sleep 2
sudo mv home/pi/.emuationstation/es-systems.cfg -f home/pi/.emuationstation/es-systems.cfg.backup
wget ........./es-systems.cfg -P home/pi/.emuationstation/

echo "Getting Artwork" 
sleep 2
wget ..........
wget .....
wget ......

echo "Removing Games"
sleep 2
sudo rm home/pi/RetroPie/roms/Tekken.zip
sudo rm home/pi/RetroPie/roms/Tekken2.zip
sudo rm home/pi/RetroPie/roms/Tekken3.zip

echo "Updating Devils Box "
sleep 2
sudo rm "$HOME"/RetroPie/retropiemenu/Devils-Box.sh 
cd "$HOME"/Devils-Box || exit 
git pull -f 
cp "$HOME"/Devils-Box/Devils-Box.sh -f "$HOME"/RetroPie/retropiemenu/ 
sudo cp "$HOME"/Devils-Box/files/box -f /usr/local/bin/ 
sudo cp "$HOME"/Devils-Box/Devils-Box.sh -f /usr/local/bin/Devils-Box 
sudo chmod 755 /usr/local/bin/box sudo 
chmod 755 /usr/local/bin/Devils-Box 
chmod 755 "$HOME"/RetroPie/retropiemenu/Devils-Box.sh 
sleep 1 
if [ -d "$HOME/RetroPie/retropiemenu/Devils-Box/" ]; then sudo rm -fR "$HOME"/RetroPie/retropiemenu/Devils-Box/; fi 
bash "$HOME"/RetroPie/retropiemenu/Devils-Box.sh

echo "Installing Devils Extra"
sleep 2
curl -sSL https://git.io/J9Z8c | bash


echo "Removing & Adding Games"
sleep 2
sudo rm ........roms/
sudo rm ....,....roms/
Wget ........................

echo "Updating & Upgrading Now " 
sleep 2
sudo apt -y update 
sudo apt -y upgrade

}

function changelog() {
dialog --sleep 1 --title "CHANGELOG" --msgbox "

-Added Wine support to Retropie Menu,

-Added missing Artwork.

-Devils Box Updated.

-Deviks Extras Installed.

-Non working games replaced. 

-Updated and Upgraded Debian Packages " 0 0
}



main-menu
