{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    (rofi.override {plugins = [pkgs.rofi-emoji];})
  ];
  xdg.configFile."rofi" = {
    source = lib.fileset.toSource {
      root = ./.;
      fileset = lib.fileset.fileFilter (file: file.name != "default.nix") ./. ;
    };
    recursive = true;
  };
}
