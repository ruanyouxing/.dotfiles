{
  username,
  lib,
  ...
}: {
  imports = [
    ../../fonts
    ../../modules/nixos
    ./hardware-configuration.nix
    ./boot.nix
    ./graphics.nix
    ./services.nix
  ];
  home-manager = {
    extraSpecialArgs = {inherit username;};
    users = {
      ${username} = import ./hm_override.nix;
    };
  };
  networking.hostName = lib.mkForce "veritas-laptop";
}
