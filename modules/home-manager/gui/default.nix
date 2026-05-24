{
  pkgs,
  customLib,
  ...
}: {
  imports = customLib.importDirModules {
    dir = ./.;
    excludeNames = ["mpv.nix"];
  };
  home.packages = with pkgs; [
    (discord.override {withVencord = true;})
    thunar
    feh
    qbittorrent-enhanced
    peazip
    handbrake
    ristretto
    gparted
    qownnotes
    kdePackages.okular
    # xournalpp
  ];
}
