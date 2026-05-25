{
  pkgs,
  lib,
  inputs,
}: let
  allFiles = lib.filesystem.listFilesRecursive ./.;
  scriptsDir = toString ./scripts;
  pkgFiles =
    builtins.filter (
      path: let
        str = toString path;
        name = baseNameOf path;
      in
        lib.strings.hasSuffix ".nix" name
        && name != "default.nix"
        && !lib.strings.hasPrefix scriptsDir str
    )
    allFiles;
in
  builtins.listToAttrs (map (path: {
      name = lib.strings.removeSuffix ".nix" (baseNameOf path);
      value = pkgs.callPackage path {};
    })
    pkgFiles)
  // {
    scripts = import ./scripts {inherit pkgs lib inputs;};
  }
