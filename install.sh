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
paru -S neofetch timeshift thunar stacer picom lxappearance rofi reflector xfce4-power-manager polkit-gnome python-psutil mpd python-mpd2 gnome-keyring fzf python-cairo betterlockscreen --noconfirm

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
paru -S code ymuse google-chrome github-desktop-bin brave quickemu quickgui preload tlp xfce4-notifyd vlc cronie --noconfirm
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

#installing nvidia drivers
#paru -S linux-headers nvidia-470xx-dkms nvidia-470xx-settings optimus-manager optimus-manager-qt --noconfirm
paru -S envycontrol --noconfirm
sudo envycontrol -s integrated

#cleanup
sudo pacman -Syu
sudo pacman -Rsn $(pacman -Qtdq)
sudo pacman -Scc
paru -Syu
paru -Rns $(paru -Qtdq)
paru --clean
rm -rf ~/.cache/*

#copying configs
cp -r configs/* ~/.config
chmod +x ~/.config/qtile/autostart.sh

#copying other files
cp -r home/* ~/.
cp home/.bashrc ~/.bashrc
chmod +x ~/automation/*
mkdir ~/OnePlace/Music

#setting lockscreen
betterlockscreen -u ~/OnePlace/wallpapers/wallpaper.jpg --fx dim,pixel

#copying touchpad configs
sudo cp etc_X11_xorg.conf.d/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf

#install auto-cpufreq
#mkdir temp
#cd temp
#git clone https://github.com/AdnanHodzic/auto-cpufreq.git
#cd auto-cpufreq && sudo ./auto-cpufreq-installer
#cd ..
#cd ..
#sudo rm -rf temp
#sudo auto-cpufreq --install
#sudo cp etc/auto-cpufreq.conf /etc/auto-cpufreq.conf

echo "System will reboot in 3 Sec..."
sleep 3
sudo reboot