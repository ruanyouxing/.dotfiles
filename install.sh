#!/bin/bash
sh -c 'sudo pacman -Syyu'
sh -c 'sudo pacman -S --needed - < pacman.txt'
paru -S --needed - < aur.txt
stow --target='/home/hungz' . 
git clone https://github.com/ruanyouxing/nvim ~/.config/nvim
git clone https://github.com/zplug/zplug ~/.zplug
