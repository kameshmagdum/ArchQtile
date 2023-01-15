#!/bin/bash

set -e
trap 'echo "An error occurred, please check the log file: $LOG_FILE"' ERR

LOG_FILE="$HOME/arch_update.log"
rm $LOG_FILE

DATE=$(date +%Y-%m-%d_%H:%M:%S)
echo "Starting on $DATE" | tee -a $LOG_FILE
echo "Welcome to Arch Linux Update Script"
echo "This script will update the official and AUR packages, remove unnecessary files and take a Timeshift snapshot before proceeding."

echo "Creating Timeshift snapshot with comment 'Running System Update on $DATE'" | tee -a $LOG_FILE
sudo timeshift --create --comment "Running System Update on $DATE" | tee -a $LOG_FILE

echo "Updating official packages" | tee -a $LOG_FILE
sudo pacman -Syu | tee -a $LOG_FILE
echo "Removing unnecessary packages" | tee -a $LOG_FILE
sudo pacman -Rsn $(pacman -Qtdq) | tee -a $LOG_FILE
echo "Clearing pacman cache" | tee -a $LOG_FILE
sudo pacman -Scc | tee -a $LOG_FILE
echo "Updating AUR packages" | tee -a $LOG_FILE
paru -Syu | tee -a $LOG_FILE
echo "Removing unnecessary AUR packages" | tee -a $LOG_FILE
paru -Rns $(paru -Qtdq) | tee -a $LOG_FILE
echo "Clearing paru cache" | tee -a $LOG_FILE
paru --clean | tee -a $LOG_FILE
echo "Finished on $DATE" | tee -a $LOG_FILE
sleep 3