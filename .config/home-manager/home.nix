{
  imports = [
    ./packages.nix
    ./shellcfg.nix
    ./bspwm.nix
    ./zathura.nix
  ];
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;
  home = {
    username = "hungz";
    homeDirectory = "/home/hungz";
    stateVersion = "23.05";
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
