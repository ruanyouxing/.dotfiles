#!/bin/sh

for path in .config/*; do ln -s "${HOME:?}/.dotfiles/$path" "${HOME:?}/$path"; done
ln -s ~/.dotfiles/.config/picom.conf ~/.config/picom.conf
