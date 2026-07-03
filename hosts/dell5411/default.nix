{
  username,
  customLib,
  extraPkgs,
  lib,
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

  home-manager = {
    extraSpecialArgs = {inherit username extraPkgs catppuccinFlavor catppuccinAccent;};
    users = {
      ${username} = import ./home-manager.nix;
    };
  };
  networking.hostName = lib.mkForce "veritas-laptop";
}
