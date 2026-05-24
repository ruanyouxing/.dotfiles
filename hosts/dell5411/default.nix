{
  username,
  customLib,
  lib,
  ...
}: {
  imports =
    customLib.importModules {
      dir = ./.;
      excludeNames = ["hm_override.nix"];
    }
    ++ [
      ../../fonts
      ../../modules/nixos
    ];
  home-manager = {
    extraSpecialArgs = {inherit username;};
    users = {
      ${username} = import ./hm_override.nix;
    };
  };
  networking.hostName = lib.mkForce "veritas-laptop";
}
