#!/bin/bash
sh -c 'sudo pacman -Syyu'
sh -c 'sudo pacman -S --needed - < pacman.txt'
yay -S --needed - < aur.txt
ln -sf "/home/hungz/.dotfiles/scripts" "${HOME}"/.local/bin/
cd ./.config/ 
for conf_dirs in *; do 
  ln -sf "/home/hungz/.dotfiles/.config/$conf_dirs" "/home/hungz/.config/$conf_dirs";
  if [ -L "/home/hungz/.dotfiles/$conf_dirs/$conf_dirs" ]; then
    unlink "/home/hungz/.dotfiles/$conf_dirs/$conf_dirs"
  fi
done
git clone https://github.com/ruanyouxing/nvim ~/.config/nvim
