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
  xdg.configFile."ranger/plugins/ranger-zoxide".source = "${ranger-zoxide}/ranger-zoxide";
  xdg.configFile."ranger/plugins/ranger-devicons".source = "${ranger-devicons}/ranger-devicons";
}
