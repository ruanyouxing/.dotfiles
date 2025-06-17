{
  pkgs,
  ...
}: let
  ranger-zoxide = pkgs.callPackage ./ranger-zoxide.nix {};
  ranger-devicons = pkgs.callPackage ./ranger-devicons.nix {};
in {
  home.packages = with pkgs; [
    ranger
    ranger-zoxide
    ranger-devicons
  ];
  xdg.configFile."ranger/plugins/ranger-zoxide".source = "${ranger-zoxide}/ranger-zoxide";
  xdg.configFile."ranger/plugins/ranger-devicons".source = "${ranger-devicons}/ranger-devicons";
}
