#!/bin/bash
onePlacePath="~/OnePlace"

echo "rsync starting..."
rsync -avh ~/.config/qtile $onePlacePath/dotfiles --delete
rsync -avh ~/.config/rofi $onePlacePath/dotfiles --delete
rsync -avh ~/.config/Thunar $onePlacePath/dotfiles --delete
rsync -avh ~/.config/xfce4 $onePlacePath/dotfiles --delete
rsync -avh ~/.config/neofetch $onePlacePath/dotfiles --delete
rsync -avh ~/.config/mpd $onePlacePath/dotfiles --delete
rsync -avh ~/.config/alacritty $onePlacePath/dotfiles --delete
cp ~/.bashrc $onePlacePath/dotfiles/.bashrc

date
echo "rsync finished..."