{pkgs,...}:{
  imports = [
    ./dotfiles.nix
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
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
