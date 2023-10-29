{
  description = "ruanyouxing flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    lanzaboote.url = "github:nix-community/lanzaboote";
  };
  outputs = {
    nixpkgs,
    home-manager,
    hyprland,
    lanzaboote,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./nixos/configuration.nix
          lanzaboote.nixosModules.lanzaboote
        ];
      };
    };
    homeConfigurations = {
      hungz = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          hyprland.homeManagerModules.default
          {
            wayland.windowManager.hyprland = {
              enable = true;
              xwayland.enable = true;
              systemdIntegration = true;
              recommendedEnvironment = true;
            };
          }
          ./home-manager/home.nix
        ];
      };
    };
  };
}
