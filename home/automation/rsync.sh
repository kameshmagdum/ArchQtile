#!/bin/bash
myHomePath="/home/kamesh"
onePlacePath="/mnt/OnePlaceDrive/OnePlace"

echo "rsync starting..."
rsync -avh $myHomePath/.config/qtile $onePlacePath/dotfiles --delete
rsync -avh $myHomePath/.config/rofi $onePlacePath/dotfiles --delete
rsync -avh $myHomePath/.config/Thunar $onePlacePath/dotfiles --delete
rsync -avh $myHomePath/.config/xfce4 $onePlacePath/dotfiles --delete
rsync -avh $myHomePath/.config/neofetch $onePlacePath/dotfiles --delete
rsync -avh $myHomePath/.config/mpd $onePlacePath/dotfiles --delete
rsync -avh $myHomePath/.config/alacritty $onePlacePath/dotfiles --delete

date
echo "rsync finished..."