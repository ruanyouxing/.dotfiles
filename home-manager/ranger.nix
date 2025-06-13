{
  config,
  pkgs,
  ...
}: let
  ranger-zoxide = pkgs.callPackage ./builds/ranger-zoxide.nix {};
  ranger-devicons = pkgs.callPackage ./builds/ranger-devicons.nix {};
in {
  home.packages = with pkgs; [
    ranger
    ranger-zoxide
    ranger-devicons
  ];
  home.file.".config/ranger/rc.conf".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.dotfiles/.config/rg/rc.conf";
  home.file.".config/ranger/scope.sh".source =
    config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.dotfiles/.config/rg/scope.sh";
  xdg.configFile."ranger/plugins/ranger-zoxide".source = "${ranger-zoxide}/ranger-zoxide";
  xdg.configFile."ranger/plugins/ranger-devicons".source = "${ranger-devicons}/ranger-devicons";
}
