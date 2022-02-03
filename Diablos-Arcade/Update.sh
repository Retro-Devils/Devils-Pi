#!/bin/bash
export NCURSES_NO_UTF8_ACS=1

rst="$(tput sgr0)"
fgred="${rst}$(tput setaf 1)" # Red
bld="$(tput bold)"
bfgred="${bld}$(tput setaf 1)"

dialog  --sleep 1 --title "Diablos Arcade Updater" --msgbox " 
-------------------------------
     ATTENTION/WARNING
-------------------------------
-This is built for Diablos Arcade.
-DO NOT USE ON OTHER IMAGES" 0 0
function main_menu() {
local choice 

  while true; do
    choice=$(dialog --backtitle "$BACKTITLE" --title "DIABLOS ARCADE UPDATER" \
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
sudo wget https://raw.githubusercontent.com/Retro-Devils/Devils-Pi/main/Diablos-Arcade/files/da-version -P /usr/local/bin/
sudo chmod 755 /usr/local/bin/da-version
clear
echo ${bld}$(tput setaf 1) "----Backing Up & Getting New ES-Systems----"
sleep 2
mkdir /home/pi/.emulationstation/backups
mv /home/pi/.emulationstation/es_systems.cfg -f /home/pi/.emulationstation/backups/es_systems.backup
sleep 1
wget https://archive.org/download/devils-updates/es_systems.cfg -P /home/pi/.emulationstation/
echo "----Getting Artwork----"
sleep 2
wget https://archive.org/download/devils-updates/simpbowl.mp4 -P /home/pi/RetroPie/roms/arcade/snap/
echo "----Removing Games-----"
sleep 2
sudo rm /home/pi/RetroPie/roms/arcade/tekken.zip
sudo rm /home/pi/RetroPie/roms/arcade/tekken2.zip
sudo rm /home/pi/RetroPie/roms/arcade/tekken3.zip
sleep 2 
echo "---Adding Devils Track 2---"
sleep 2
wget "https://archive.org/download/devils-updates/Music/NEFFEX - Rollin' With The Devil.mp3" -P "/home/pi/bgm/NEFFEX - Rollin' With The Devil.mp3"
echo "---Replacing Wine Logo---"
wget https://github.com/ALLRiPPED/es-theme-devil-chromey/raw/main/wine/_inc/system.png && mv -f system.png "/opt/retropie/configs/all/emulationstation/themes/devil chromey/wine/_inc"
sleep 2 
echo "----Updating Devils Box----"
sleep 2
sudo rm /home/pi/RetroPie/retropiemenu/Devils-Box.sh
cd /home/pi/Devils-Box
git pull -f
cp /home/pi/Devils-Box/Devils-Box.sh -f /home/pi/RetroPie/retropiemenu/
sudo cp /home/pi/Devils-Box/files/box -f /usr/local/bin/
sudo cp /home/pi/Devils-Box/Devils-Box.sh -f /usr/local/bin/Devils-Box
sudo chmod 755 /usr/local/bin/box
sudo chmod 755 /usr/local/bin/Devils-Box
chmod 755 /home/pi/RetroPie/retropiemenu/Devils-Box.sh
sleep 2
echo "Updating & Upgrading"
sudo apt -y update 
sudo apt -y upgrade
}

function changelog() {
dialog --sleep 1 --title "CHANGELOG" --msgbox "
-Added Wine support to Retropie Menu.

-Added missing Artwork.

-Devils Box Updated.

-Devils Extras Installed.

-Non working games removed.

-Updated and Upgraded Debian Packages" 0 0
}

main_menu
