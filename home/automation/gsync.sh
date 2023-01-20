#!/bin/bash
notify-send "OnePlace" "Syncing the data..."
cd
rclone -v --log-file=rclone_kameshbook.log sync OnePlace kameshbook:ArchQtile
notify-send "OnePlace" "Data synced..."