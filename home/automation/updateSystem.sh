#!/bin/bash
#Updating system
#sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
#cleanup
sudo pacman -Scc
sudo pacman -Rns $(pacman -Qtdq)
rm -rf ~/.cache/*
paru
echo "System update done..."
sleep 10