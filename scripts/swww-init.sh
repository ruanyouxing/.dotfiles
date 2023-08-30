#!/bin/sh
if pgrep -x swww-daemon  > /dev/null
then
  swww kill 
  swww init
else 
  swww init
fi
