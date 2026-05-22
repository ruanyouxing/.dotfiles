{
  pkgs,
  lib,
  ...
}: let
  dirContents = builtins.readDir ./.;
  isNixFile = name: type:
    type
    == "regular"
    && lib.strings.hasSuffix ".nix" name
    && name != "default.nix";

  isScriptFile = name: type:
    type
    == "regular"
    && !(lib.strings.hasSuffix ".nix" name);

  nixFiles = lib.filterAttrs isNixFile dirContents;
  importsList = lib.mapAttrsToList (name: _: ./. + "/${name}") nixFiles;

  scriptFiles = lib.filterAttrs isScriptFile dirContents;
  packagesList =
    lib.mapAttrsToList (
      name: _: let
        pkgName = lib.strings.removeSuffix ".sh" name;
      in
        pkgs.writeShellScriptBin pkgName (builtins.readFile (./. + "/${name}"))
    )
    scriptFiles;
  dependencies = with pkgs; [
    libnotify
  ];
in {
  imports = importsList;
  home.packages = packagesList ++ dependencies;
}
