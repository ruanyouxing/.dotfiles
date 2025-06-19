get_backlights() {
  #Requires ddccontrol
  #yay -S ddccontrol
if command -v ddccontrol &> /dev/null; then
  log="/tmp/brightness-logfile"
  ddccontrol -r 0x10 dev:/dev/i2c-2 | ag 'Control 0x10:\s\+\/[0-9]{1,3}\/[0-9]{1,3}' > "$log"
fi
}

get_backlights  > /dev/null 2>&1
echo -ne " %{F#DDD60D} $(awk -e  '{print $3}' < "$log")"
