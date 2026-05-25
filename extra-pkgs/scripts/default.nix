{
  pkgs,
  lib,
  inputs,
  ...
}: let
  allFiles = lib.filesystem.listFilesRecursive ./.;
  nixFiles =
    builtins.filter (
      path:
        lib.strings.hasSuffix ".nix" (toString path)
        && baseNameOf path != "default.nix"
    )
    allFiles;

  nixPackages =
    map (
      path:
        import path {inherit pkgs lib inputs;}
    )
    nixFiles;

  scriptFiles =
    builtins.filter (
      path: let
        name = baseNameOf path;
      in
        (lib.strings.hasSuffix ".sh" name || !(builtins.match ".*\\.[a-zA-Z0-9]+$" name != null))
        && name != "README.md"
    )
    allFiles;

  shellPackages =
    map (
      path: let
        name = baseNameOf path;
        pkgName = lib.strings.removeSuffix ".sh" name;
      in
        pkgs.writeShellScriptBin pkgName (builtins.readFile path)
    )
    scriptFiles;
in
  nixPackages ++ shellPackages
