lib: {
  inherit (import ./excludeExt.nix lib) excludeNixFiles excludeExt;
  inherit (import ./autoImport.nix lib) importModules;
}
