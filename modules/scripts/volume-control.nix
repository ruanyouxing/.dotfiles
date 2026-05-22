{pkgs,...}: let
  volume-control = pkgs.writeShellScriptBin "volume-control" ''
    if [ "$1" = "up" ]; then
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
    elif [ "$1" = "down" ]; then
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
    elif [ "$1" = "mute" ]; then
      wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      fi
  '';
in {
  home.packages = [volume-control];
}
