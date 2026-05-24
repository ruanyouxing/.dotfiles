{
  inputs,
  username,
  homeDir,
  customLib,
  ...
}: {
  imports =
    customLib.importModules {
      dir = ./.;
      includeDefaultNix = true;
    }
    ++ [
      ../scripts
      inputs.spicetify-nix.homeManagerModules.default
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
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
