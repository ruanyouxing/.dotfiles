{
  username,
  customLib,
  extraPkgs,
  catppuccinFlavor,
  catppuccinAccent,
  ...
}: {
  imports =
    customLib.importModules {
      dir = ./.;
      excludeNames = ["home-manager.nix"];
    }
    ++ [
      ../../modules/nixos
    ];

  environment.sessionVariables.HOSTNAME = "nixosPC";
  home-manager = {
    extraSpecialArgs = {inherit extraPkgs catppuccinFlavor catppuccinAccent;};
    users.${username} = import ./home-manager.nix;
  };
}
