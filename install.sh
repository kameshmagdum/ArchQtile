#!/bin/bash
#installing paru
sudo pacman -S --needed base-devel
mkdir temp
cd temp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
cd ..
sudo rm -rf temp

#updating using paru
paru --noconfirm

#installing apps
paru -S neofetch timeshift thunar stacer firefox picom lxappearance rofi xfce4-power-manager polkit-gnome python-psutil mpd python-mpd2 gnome-keyring fzf python-cairo betterlockscreen --noconfirm

#installing fonts
paru -S nerd-fonts-jetbrains-mono noto-fonts noto-fonts-emoji ttf-linux-libertine ttf-dejavu --noconfirm

#installing icons and themes
paru -S papirus-icon-theme arc-gtk-theme --noconfirm

#installing bluetooth
paru -S bluez blueman --noconfirm
sudo systemctl enable bluetooth.service

#cleanup
sudo pacman -Scc
sudo pacman -Rns $(pacman -Qtdq)
rm -rf ~/.cache/*
paru -Scca

#coping concigs
cp -r configs/* ~/.config
chmod +x ~/.config/qtile/autostart.sh

#setting lockscreen
betterlockscreen -u ~/.config/qtile/forest.jpg --fx dim,pixel

#copying other files
rm -rf ~/.bashrc
cp -r home/* ~/.
chmod +x ~/automation/*
mkdir ~/OnePlace
mkdir ~/OnePlace/Music

sudo reboot