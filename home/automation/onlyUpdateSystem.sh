#!/bin/bash
echo "Updating official packages"
sudo pacman -Syu
echo "Removing unnecessary packages"
sudo pacman -Rsn $(pacman -Qtdq)
echo "Clearing pacman cache"
sudo pacman -Scc
echo "Updating AUR packages"
paru -Syu
echo "Removing unnecessary AUR packages"
paru -Rns $(paru -Qtdq)
echo "Clearing paru cache"
paru --clean
echo "Finished on $DATE"
sleep 3