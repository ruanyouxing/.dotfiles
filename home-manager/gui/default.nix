{
  pkgs,
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
    ./obs.nix
  ];
  home.packages = with pkgs; [
    (discord.override { withVencord = true; })
    xfce.thunar
    feh
    kitty
  ];
}
