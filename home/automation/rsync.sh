#!/bin/bash

echo "rsync starting..."
rsync -avh ~/.config/qtile ~/Documents/GitHub/ArchQtile/configs --delete
rsync -avh ~/automation ~/Documents/GitHub/ArchQtile/home --delete
cp ~/.bashrc ~/Documents/GitHub/ArchQtile/home/.bashrc

date
echo "rsync finished..."
sleep 3