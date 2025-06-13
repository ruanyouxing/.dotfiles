{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [
    (import ./builds/spotify.nix)
  ];
  home.packages = with pkgs; [
    (discord.override {withVencord = true;})
    distrobox
    mpv
    obs-studio
    inputs.nixpkgs-wayland.packages.x86_64-linux.obs-wlrobs
    pywal
    gh
    foot
    htop
    spotify
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
