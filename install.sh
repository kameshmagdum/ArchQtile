#!/bin/bash
#installing yay
sudo pacman -S --needed base-devel
mkdir temp
cd temp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
cd ..
sudo rm -rf temp

#updating using yay
yay

#installing apps
yay -S neofetch timeshift thunar google-chrome visual-studio-code-bin github-desktop-bin picom lxappearance rofi xfce4-power-manager polkit-gnome python-psutil mpd python-mpd2 gnome-keyring fzf python-cairo betterlockscreen

#installing fonts
yay -S nerd-fonts-jetbrains-mono noto-fonts noto-fonts-emoji ttf-linux-libertine ttf-dejavu

#installing icons and themes
yay -S papirus-icon-theme arc-gtk-theme

#installing bluetooth
yay -S bluez blueman
sudo systemctl enable bluetooth.service

cp -r home/* .
cp -r configs/* ~/.config

betterlockscreen -u ~/.config/qtile/forest.jpg --fx dim,pixel