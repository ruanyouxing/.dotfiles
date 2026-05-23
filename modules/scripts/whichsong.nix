{pkgs, ...}:
pkgs.writeShellScriptBin "whichsong" ''

    status=$(playerctl -p spotify status 2>/dev/null)
    if [ $? -ne 0 ]; then
      echo "Currently not playing"
      exit 1
    fi
  echo   $(playerctl metadata --format "{{ artist }} - {{ title }}" -p spotify)
''
