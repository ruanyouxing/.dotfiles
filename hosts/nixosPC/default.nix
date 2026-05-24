{
  username,
  customLib,
  ...
}: {
  imports =
    customLib.importModules {
      dir = ./.;
      excludeNames = ["hm_override.nix"];
    }
    ++ [
      ../../modules/nixos
      ../../fonts
    ];

  environment.sessionVariables.HOSTNAME = "nixosPC";
  home-manager.users.${username} = import ./hm_override.nix;
}
