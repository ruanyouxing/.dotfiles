#!/bin/sh

for path in .config/*; do ln -s "${HOME:?}/.dotfiles/$path" "${HOME:?}/$path"; done
if [ ! -d "${HOME}/.config/home-manager/" ]; then
  ln -s "${HOME:?}/.dotfiles/home-manager" "${HOME:?}/.config/home-manager"
fi
if [ ! -d "${HOME}/.local/bin" ]; then 
  mkdir ~/.local/bin
  cp -vr ./scripts/* ~/.local/bin
fi
if [ ! -d "${HOME}/.config/nvim" ]; then
  git clone https://github.com/ruanyouxing/nvim ~/.config/nvim 
fi
