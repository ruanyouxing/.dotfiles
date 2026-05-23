{pkgs,...}:
  pkgs.writeShellScriptBin "toggle-bar" ''
    STATE_FILE="/tmp/progress-mode"
    if [[ ! -f "$STATE_FILE" ]]; then
      echo "1" > "$STATE_FILE"
    fi

    current=$(cat "$STATE_FILE")
    if [[ "$current" == "1" ]]; then
      echo "0" > "$STATE_FILE"
    else
      echo "1" > "$STATE_FILE"
      fi
  ''
