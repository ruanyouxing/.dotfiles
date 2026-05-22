{username, ...}: {
  imports = [
    ./boot.nix
    ./graphics.nix
    ./extra-mounts.nix
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../fonts
  ];

  environment.sessionVariables.HOSTNAME = "nixosPC";
  home-manager.users.${username} = import ./hm_override.nix;
}
