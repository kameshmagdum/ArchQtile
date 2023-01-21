#!/bin/bash
INSTALLAPP=""
sudo timeshift --create --comment "Before installing app $INSTALLAPP"
#installing apps
paru -S $INSTALLAPP --needed
