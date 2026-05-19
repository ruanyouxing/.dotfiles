{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    kitty
  ];
  xdg.configFile."kitty" = {
    source = lib.fileset.toSource {
      root = ./.;
      fileset = lib.fileset.fileFilter (file: file.name != "default.nix") ./.;
    };
    recursive = true;
  };
}
