{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./quickshell
    ./gtk.nix
    ./browser.nix
    ./spotify.nix
    ./flameshot.nix
    ./qt.nix
  ];
  home.packages = with pkgs; [
    obs-studio
    inputs.nixpkgs-wayland.packages.x86_64-linux.obs-wlrobs
    (discord.override { withVencord = true; })
    xfce.thunar
    feh
    kitty
  ];
}
