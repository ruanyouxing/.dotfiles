{
  imports = [
    ./hypr
    ./audio
    ./gui
    ./user
    ./bspwm
    ./tools
  ];
  programs.home-manager.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  fonts.fontconfig.enable = true;
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
  home = {
    username = "hungz";
    homeDirectory = "/home/hungz";
    stateVersion = "23.05";
  };
}
