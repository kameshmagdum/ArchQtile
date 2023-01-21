#!/bin/bash
INSTALLAPP="gwenview qt5-styleplugins"
sudo timeshift --create --comment "Before installing app $INSTALLAPP"
#installing apps
paru -S $INSTALLAPP --needed

sudo cp /etc/environment /etc/environment_backup
echo "XDG_CURRENT_DESKTOP=Unity" | sudo tee -a /etc/environment
echo "QT_QPA_PLATFORMTHEME=gtk2" | sudo tee -a /etc/environment