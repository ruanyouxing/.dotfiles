lib: rec {
  importModules = {
    dir,
    excludeNames ? [],
    includeDefaultNix ? false,
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
          else if type == "directory" && includeDefaultNix
          then builtins.pathExists (dir + "/${name}/default.nix")
          else false
      )
      dirContents;
  in
    lib.mapAttrsToList (name: _: dir + "/${name}") validEntries;
}
