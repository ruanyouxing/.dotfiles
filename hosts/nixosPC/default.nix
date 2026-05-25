{
  username,
  customLib,
  extraPkgs,
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
    extraSpecialArgs = {inherit extraPkgs;};
    users.${username} = import ./home-manager.nix;
  };
}
