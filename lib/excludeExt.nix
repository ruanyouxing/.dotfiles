lib: let
  inherit (lib.fileset) toSource fileFilter;
  inherit (lib.strings) hasSuffix;
in {
  excludeNixFiles = srcPath:
    toSource {
      root = srcPath;
      fileset = fileFilter (file: !(hasSuffix ".nix" file.name)) srcPath;
    };

  excludeExt = ext: srcPath:
    toSource {
      root = srcPath;
      fileset = fileFilter (file: !(hasSuffix ext file.name)) srcPath;
    };
}
