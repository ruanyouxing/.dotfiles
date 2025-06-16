{pkgs, ...}: let
  bc  = "${pkgs.bc}/bin/bc";
in
  pkgs.writeShellScript "player-progress" ''
    BAR_LENGTH=20
    FULL="█"
    THREE_QUARTER="▓"
    HALF="▒"
    QUARTER="░"
    EMPTY=" "

    format_time() {
      local T=$1
      printf "%02d:%02d" $((T / 60)) $((T % 60))
    }

    if ! playerctl status &>/dev/null; then
      echo '{"text": "⏹️ No player", "tooltip": "No active media player", "class": "stopped"}'
      exit 0
    fi

    position=$(playerctl -p spotify position 2>/dev/null)
    duration=$(playerctl -p spotify metadata mpris:length 2>/dev/null)

    if [[ -z "$position" || -z "$duration" || "$duration" == "0" ]]; then
      echo '{"text": "⏳ Loading...", "tooltip": "Waiting for metadata", "class": "paused"}'
      exit 0
    fi

    # Chuyển về số nguyên
    position_sec=$(echo "$position" | cut -d'.' -f1)
    duration_sec=$(echo "$duration / 1000000" | ${bc})

    if [[ "$duration_sec" -eq 0 ]]; then
      percent=0
    else
      percent=$(echo "scale=4; $position_sec / $duration_sec" | ${bc})
    fi

    filled_float=$(echo "$percent * $BAR_LENGTH" | ${bc} -l )
    filled_int=$(echo "$filled_float" | cut -d'.' -f1)
    partial=$(echo "$filled_float - $filled_int" | ${bc} -l )

    if (( $(echo "$partial > 0.75" | ${bc} -l ) )); then
      mid_block="$THREE_QUARTER"
    elif (( $(echo "$partial > 0.5" | ${bc} -l ) )); then
      mid_block="$HALF"
    elif (( $(echo "$partial > 0.25" | ${bc} -l ) )); then
      mid_block="$QUARTER"
    else
      mid_block=""
    fi

    if [[ -n "$mid_block" ]]; then
      mid_block_len=1
    else
      mid_block_len=0
    fi

    empty_blocks=$((BAR_LENGTH - filled_int - mid_block_len))

    bar=""
    for i in $(seq 1 $filled_int); do bar+="$FULL"; done
    bar+="$mid_block"
    for i in $(seq 1 $empty_blocks); do bar+="$EMPTY"; done

    text="[$bar] $(format_time "$position_sec")/$(format_time "$duration_sec")"
    echo "{\"text\": \"$text\", \"tooltip\": \"Now Playing\", \"class\": \"playing\"}"
  ''
