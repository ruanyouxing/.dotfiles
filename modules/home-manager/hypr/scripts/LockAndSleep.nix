{ pkgs }:
pkgs.writeShellScript "lockandsleep" ''
  hyprlock &
  locker_pid=$!
  sleep 60
  if kill -0 "$locker_pid" 2>/dev/null; then
      hyprctl dispatch dpms off
  fi
  sleep 1140
  if kill -0 "$locker_pid" 2>/dev/null; then
      systemctl suspend
  fi
''
