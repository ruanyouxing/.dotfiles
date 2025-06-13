{pkgs, inputs,...}: {
  home.packages = with pkgs; [
    (discord.override {withVencord = true;})
    distrobox
    mpv
    obs-studio
    inputs.nixpkgs-wayland.packages.x86_64-linux.obs-wlrobs
    pywal
    spotify
    gh
    foot
    htop
    python311Packages.requests
  ];
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "ruanyouxing7@gmail.com";
    userName = "ruanyouxing";
  };
}
