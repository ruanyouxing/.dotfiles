{
  username,
  customLib,
  extraPkgs,
  lib,
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
  home-manager = {
    extraSpecialArgs = {inherit username extraPkgs;};
    users = {
      ${username} = import ./home-manager.nix;
    };
  };
  networking.hostName = lib.mkForce "veritas-laptop";
}
