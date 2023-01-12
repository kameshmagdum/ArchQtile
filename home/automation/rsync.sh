#!/bin/bash

echo "rsync starting..."
rsync -avh ~/.config/qtile ~/GIT/ArchQtileData --delete
rsync -avh ~/.config/rofi ~/GIT/ArchQtileData --delete
rsync -avh ~/.config/Thunar ~/GIT/ArchQtileData --delete
rsync -avh ~/.config/xfce4 ~/GIT/ArchQtileData --delete
rsync -avh ~/.config/neofetch ~/GIT/ArchQtileData --delete
rsync -avh ~/.config/mpd ~/GIT/ArchQtileData --delete
rsync -avh ~/.config/alacritty ~/GIT/ArchQtileData --delete
rsync -avh ~/automation ~/GIT/ArchQtileData --delete

cp ~/.bashrc ~/GIT/ArchQtileData/.bashrc

date
sleep 5
echo "rsync finished..."