#!/usr/bin/env bash

# Terminate already running bar instances
killall polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar pam1 &
polybar pam2 &
polybar pam3 &
polybar pam4 &
polybar pam5 &
polybar pam6 &
