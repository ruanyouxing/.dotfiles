{
  imports = [
    ./shellcfg.nix
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    lfs.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
  home.file.".config" = {
    source = ../../../config;
    recursive = true;
  };
}
