#!/bin/sh
if pgrep -x swww-daemon  > /dev/null
then
  swww kill 
fi
swww-daemon
swww img ~/.dotfiles/backgrounds/laptop_background.jpg
