{
  pkgs,
  customLib,
  ...
}: {
  imports = customLib.importModules {
    dir = ./.;
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
