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
paru -S bluez blueman alsa-utils --noconfirm
sudo systemctl enable bluetooth.service

#installing packages to support ntfs and external drives in thunar
paru -S ntfs-3g gvfs peazip-gtk2-bin --noconfirm

#installing additional apps
paru -S code ymuse google-chrome github-desktop-bin brave quickemu quickgui envycontrol preload tlp --noconfirm
sudo systemctl enable tlp
sudo systemctl enable preload

#Installing rofi themes
mkdir temp
cd temp
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh
cd ..
cd ..
sudo rm -rf temp

#Installing lightdm themes
paru -S lightdm-webkit2-greeter lightdm-webkit-theme-aether --noconfirm

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