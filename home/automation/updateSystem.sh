#!/bin/bash
DATE=$(date +%Y-%m-%d_%H:%M:%S)
echo "Starting on $DATE"
echo "Welcome to Arch Linux Update Script"
echo "This script will update the official and AUR packages, remove unnecessary files and take a Timeshift snapshot before proceeding."

echo "Creating Timeshift snapshot with comment 'Running System Update on $DATE'"
sudo timeshift --create --comment "Running System Update on $DATE"

sudo reflector --verbose -l 20 -p https --sort rate --save /etc/pacman.d/mirrorlist

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