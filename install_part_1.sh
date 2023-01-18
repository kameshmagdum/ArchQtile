#!/bin/bash
#installing paru
sudo pacman -S --needed base-devel gnome-disk-utility
mkdir temp
cd temp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
cd ..
sudo rm -rf temp

#updating using paru
paru -Syu --noconfirm

#installing timeshift
paru -S timeshift stacer --noconfirm

#updating the system
sudo pacman -Syu
sudo pacman -Rsn $(pacman -Qtdq)
sudo pacman -Scc
paru -Syu
paru -Rns $(paru -Qtdq)
paru --clean
rm -rf ~/.cache/*

echo "System will reboot in 3 Sec..."
sleep 3
sudo reboot