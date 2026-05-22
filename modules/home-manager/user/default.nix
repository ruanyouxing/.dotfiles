{
  imports = [
    ./shellcfg.nix
  ];
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user = {
      email = "ruanyouxing7@gmail.com";
      name = "ruanyouxing";
    };
  };
}
