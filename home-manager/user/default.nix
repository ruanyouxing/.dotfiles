{pkgs,customLib,...}:let
  inherit (customLib.genSymLinks) genConfLinks;
in {
  imports = [
    ./shellcfg.nix
  ];
  home.packages = with pkgs; [
    distrobox
    mpv
    pywal
    gh
    htop
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    lfs.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
  home.file = genConfLinks ../../.config {};
}
