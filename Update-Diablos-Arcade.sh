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
