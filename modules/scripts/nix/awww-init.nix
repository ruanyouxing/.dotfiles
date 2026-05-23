{pkgs, ...}:
pkgs.writeShellScriptBin "awww-init" ''
  if pgrep -x awww-daemon  > /dev/null
  then
    awww kill
  fi
  awww-daemon
''
