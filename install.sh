#!/bin/bash
sh -c 'sudo pacman -Syyu'
sh -c 'sudo pacman -S --needed - < pacman.txt'
paru -S --needed - < aur.txt
cp -vr ./scripts ~/.local/bin/
stow --target='/home/hungz' . 
git clone https://github.com/ruanyouxing/nvim ~/.config/nvim
