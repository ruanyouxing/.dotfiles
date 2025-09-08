{
  imports = [
    ./boot.nix
    ./graphics.nix
    ./extra-mounts.nix
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../fonts
  ];
  home-manager.users.hungz = import ./home-manager;
}
