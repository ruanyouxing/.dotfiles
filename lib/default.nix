lib: {
  excludeNixFiles = (import ./excludeExt.nix lib).excludeNixFiles;
  excludeExt = (import ./excludeExt.nix lib).excludeExt;
  RandomBullshitsGo = (import ./autoImport.nix lib).RandomBullshitsGo;
  importDirModules = (import ./autoImport.nix lib).importDirModules;
}
