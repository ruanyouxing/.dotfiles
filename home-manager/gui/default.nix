{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./quickshell
    ./gtk.nix
    ./browser.nix
  ];
  nixpkgs.overlays = [
    (import ./spotify.nix)
  ];
  home.packages = with pkgs; [
    obs-studio
    inputs.nixpkgs-wayland.packages.x86_64-linux.obs-wlrobs
    (discord.override {withVencord = true;})
    spotify
  ];
}
