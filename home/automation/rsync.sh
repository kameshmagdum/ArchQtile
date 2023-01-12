#!/bin/bash

echo "rsync starting..."
rsync -avh ~/.config/qtile ~/OnePlace/dotfiles --delete
rsync -avh ~/.config/rofi ~/OnePlace/dotfiles --delete
rsync -avh ~/.config/Thunar ~/OnePlace/dotfiles --delete
rsync -avh ~/.config/xfce4 ~/OnePlace/dotfiles --delete
rsync -avh ~/.config/neofetch ~/OnePlace/dotfiles --delete
rsync -avh ~/.config/mpd ~/OnePlace/dotfiles --delete
rsync -avh ~/.config/alacritty ~/OnePlace/dotfiles --delete
rsync -avh ~/automation ~/OnePlace/dotfiles --delete

cp ~/.bashrc ~/OnePlace/dotfiles/.bashrc

date
sleep 5
echo "rsync finished..."