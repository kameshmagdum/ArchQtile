#!/usr/bin/env bash
picom -b
nm-applet &
xfce4-power-manager &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
blueman-applet &

#start mpd
[ ! -s ~/.config/mpd/pid ] && mpd &
mpDris2 &

/usr/lib/xfce4/notifyd/xfce4-notifyd &
