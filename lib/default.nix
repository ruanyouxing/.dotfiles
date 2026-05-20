lib: {
  excludeNixFiles = (import ./excludeExt.nix lib).excludeNixFiles;
  excludeExt = (import ./excludeExt.nix lib).excludeExt;
}
