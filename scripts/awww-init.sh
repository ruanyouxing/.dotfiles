#!/bin/sh
if pgrep -x awww-daemon  > /dev/null
then
  awww kill 
fi
awww-daemon
awww img ~/.dotfiles/backgrounds/laptop_background.jpg
