{ inputs, catppuccinFlavor ? "mocha", ... }: {
  imports = [ inputs.macefi.nixosModules.default ];
  services.macefi.catppuccinFlavor = catppuccinFlavor;
}
