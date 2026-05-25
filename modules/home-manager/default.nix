{
  inputs,
  username,
  homeDir,
  customLib,
  extraPkgs,
  ...
}: {
  imports =
    customLib.importModules {
      dir = ./.;
      includeDefaultNix = true;
    }
    ++ [
      inputs.spicetify-nix.homeManagerModules.default
      inputs.catppuccin.homeModules.catppuccin
    ];

  programs.home-manager.enable = true;
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  home = {
    inherit username;
    homeDirectory = homeDir;
    stateVersion = "26.05";
    packages = extraPkgs.scripts;
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
