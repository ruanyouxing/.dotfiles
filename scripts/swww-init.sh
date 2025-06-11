#!/bin/sh
if pgrep -x swww-daemon  > /dev/null
then
  swww kill 
fi
swww img ~/.dotfiles/image.png
