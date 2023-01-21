#!/bin/bash
notify-send "OnePlace" "Downloading the data..."
cd
rclone -v --log-file=rclone_kameshbook.log sync kameshbook:ArchQtile OnePlace
notify-send "OnePlace" "Data downloaded..."