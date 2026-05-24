lib: rec {
  RandomBullshitsGo = {
    dir,
    excludeNames ? [],
  }: let
    allFiles = lib.filesystem.listFilesRecursive dir;
  in
    builtins.filter (
      path: let
        name = baseNameOf path;
      in
        lib.strings.hasSuffix ".nix" name
        && name != "default.nix"
        && !(builtins.elem name excludeNames)
    )
    allFiles;
  importDirModules = {
    dir,
    excludeNames ? [],
  }: let
    dirContents = builtins.readDir dir;
    validEntries =
      lib.filterAttrs (
        name: type:
          if type == "regular"
          then
            name
            != "default.nix"
            && lib.strings.hasSuffix ".nix" name
            && !(builtins.elem name excludeNames)
          else if type == "directory"
          then builtins.pathExists (dir + "/${name}/default.nix")
          else false
      )
      dirContents;
  in
    lib.mapAttrsToList (name: _: dir + "/${name}") validEntries;
}
