{inputs, ...}: let
  assetsFolder = inputs.self + "/assets/";
in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "lockandsleep";
        text = "Lock screen";
        keybind = "l";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Log out";
        keybind = "e";
      }
      {
        label = "sleep";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "s";
      }
      {
        label = "poweroff";
        action = "systemctl poweroff";
        text = "Power off";
        keybind = "u";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };
  xdg.configFile."wlogout/assets".source = toString assetsFolder + "/wlogout_icons";
  catppuccin.wlogout.extraStyle = builtins.readFile ./wlogout.css;
}
