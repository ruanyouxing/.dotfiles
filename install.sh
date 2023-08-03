#!/bin/sh

# for path in .config/*; do ln -s "${HOME:?}/.dotfiles/$path" "${HOME:?}/$path"; done
if [ ! -d '/home/hungz/.config/home-manager/' ]; then
  ln -s "${HOME:?}/.dotfiles/home-manager" "${HOME:?}/.config/home-manager"
fi
