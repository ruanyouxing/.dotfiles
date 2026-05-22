{pkgs, ...}: let
  weather = pkgs.writeShellScriptBin "weather" ''

    case "$1" in --moon)
        curl -s "wttr.in?format=%m"
      ;;
    --temp)
      raw_temp=$(curl -s "wttr.in?format=%t")
      clean_temp=$(echo "$raw_temp" | sed 's/^+//')
      echo "$clean_temp"
      ;;
    --weather)
      curl -s "wttr.in/DakLak?format=%c"
      ;;
    --windspeed)
      curl -s "wttr.in/DakLak?format=%w"
      ;;
    --humidity)
     echo -n "󰖌" && curl -s "wttr.in?format=%h"
      ;;
    *)
      exit 1 ;;
    esac
  '';
in {
  home.packages = [
    weather
  ];
}
