{
  pkgs,
  ...
}:
let
  inherit (pkgs) callPackage;
in
{
  audio-toggle = callPackage ./audio-toggle.nix { };
  hyprland-startup = callPackage ./hyprland-startup.nix { };
  music-bar = callPackage ./music-bar.nix { };
  volume-control = callPackage ./volume-control.nix { };
  weather = callPackage ./weather.nix { };
  lockAndSleep  = callPackage ./LockAndSleep.nix {};
}
