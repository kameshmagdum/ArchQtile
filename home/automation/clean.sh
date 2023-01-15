#!/bin/bash
sudo pacman -Rsn $(pacman -Qtdq)
sudo pacman -Scc
paru -Rns $(paru -Qtdq)
paru --clean
echo "Finished Cleaning"
sleep 3