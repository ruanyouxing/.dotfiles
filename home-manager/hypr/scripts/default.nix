{
  pkgs,
  inputs,
  ...
}:
let
  inherit (pkgs) callPackage;
in
{
  lizzy = callPackage ./lizzy.nix {
    naersk = callPackage inputs.naersk { };
  };
  audio-toggle = callPackage ./audio-toggle.nix { };
  hyprland-startup = callPackage ./hyprland-startup.nix { };
  music-bar = callPackage ./music-bar.nix { };
  volume-control = callPackage ./volume-control.nix { };
  weather = callPackage ./weather.nix { };
}
