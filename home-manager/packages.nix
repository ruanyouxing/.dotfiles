{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    distrobox
    mpv
    obs-studio
    pavucontrol
    pywal
    spotify
    gh
    foot
    python311Packages.requests
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
