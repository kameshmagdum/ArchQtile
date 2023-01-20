#!/bin/bash
notify-send "Rsync" "Syncing the configs..."
date
echo "rsync starting..."
rsync -avh ~/.config/qtile ~/Documents/GitHub/ArchQtile/configs --delete
rsync -avh ~/.config/rofi ~/Documents/GitHub/ArchQtile/configs --delete
rsync -avh ~/automation ~/Documents/GitHub/ArchQtile/home --delete
cp ~/.bashrc ~/Documents/GitHub/ArchQtile/home/.bashrc
echo "rsync finished..."
date
notify-send "Rsync" "Configs synced..."