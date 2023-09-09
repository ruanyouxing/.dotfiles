{
  imports = [
    ./packages.nix
    ./shellcfg.nix
    ./bspwm.nix
    ./gtk.nix
    ./mpd.nix
    ./browser.nix
    ./hyprland.nix
    ./zathura.nix
    ./neovim.nix
  ];
  programs.home-manager.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  fonts.fontconfig.enable = true;
  home = {
    username = "hungz";
    homeDirectory = "/home/hungz";
    stateVersion = "23.05";
  };
}
