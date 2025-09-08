{
  imports = [
    ../../fonts
    ../../modules/nixos
    ./hardware-configuration.nix
    ./boot.nix
    ./graphics.nix
    ./services.nix
  ];
  home-manager = {
    users = {
      "hungz" = import ./home-manager;
    };
  };
}
