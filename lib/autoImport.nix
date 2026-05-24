# lib: rec {
#   importModules = {
#     dir,
#     excludeNames ? [],
#     includeDefaultNix ? false,
#   }: let
#     dirContents = lib.filesystem.listFilesRecursive dir;
#     validEntries =
#       lib.filterAttrs (
#         name: type:
#           if type == "regular"
#           then
#             name
#             != "default.nix"
#             && lib.strings.hasSuffix ".nix" name
#             && !(builtins.elem name excludeNames)
#           else if type == "directory" && includeDefaultNix
#           then builtins.pathExists (dir + "/${name}/default.nix")
#           else false
#       )
#       dirContents;
#   in
#     lib.mapAttrsToList (name: _: dir + "/${name}") validEntries;
# }
lib: rec {
  importModules = {
    dir,
    excludeNames ? [],
    includeDefaultNix ? false,
  }: let
    allFiles = lib.filesystem.listFilesRecursive dir;
    validEntries =
      builtins.filter (
        path: let
          name = baseNameOf path;
          isRootDefaultNix = path == (dir + "/default.nix");
        in
          lib.strings.hasSuffix ".nix" name
          && !(builtins.elem name excludeNames)
          && !isRootDefaultNix
          && (name != "default.nix" || includeDefaultNix)
      )
      allFiles;
  in
    validEntries;
}
