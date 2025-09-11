{ pkgs, ... }:
let
  inherit (import ../scripts { inherit pkgs; }) lockAndSleep;
in
{
  home.packages = with pkgs; [ hypridle ];
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        on_unlock_cmd = "pkill -SIGUSR2 waybar";
        after_sleep_cmd = "loginctl lock-session";
        ignore_dbus_inhibit = false;
      };
      listener = [
        # {
        #   timeout = 300;
        #   on-timeout = "hyprctl dispatch dpms off";
        # }
        # {
        #   timeout = 600;
        #   on-timeout = "${lockAndSleep}";
        # }
      ];
    };
  };
}
