{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    distrobox
    mpv
    obs-studio
    pavucontrol
    pywal
    spotify
    python311Packages.requests
    google-chrome
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
