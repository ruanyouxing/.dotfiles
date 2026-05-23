{
  pkgs,
  lib,
  inputs,
  ...
}: let
  dirContents = builtins.readDir ./.;

  isNixFile = name: type:
    type
    == "regular"
    && lib.strings.hasSuffix ".nix" name
    && name != "default.nix";

  nixFiles = lib.filterAttrs isNixFile dirContents;

  nixPackages =
    lib.mapAttrsToList (
      name: _:
        import (./. + "/${name}") {inherit pkgs lib inputs;}
    )
    nixFiles;

  isScriptFile = name: type:
    type
    == "regular"
    && !(lib.strings.hasSuffix ".nix" name);

  scriptFiles = lib.filterAttrs isScriptFile dirContents;

  shellPackages =
    lib.mapAttrsToList (
      name: _: let
        pkgName = lib.strings.removeSuffix ".sh" name;
      in
        pkgs.writeShellScriptBin pkgName (builtins.readFile (./. + "/${name}"))
    )
    scriptFiles;
in {
  home.packages = nixPackages ++ shellPackages;
}
