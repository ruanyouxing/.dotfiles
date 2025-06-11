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
  }@inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	specialArgs = {inherit inputs;};
        modules = [
          ./nixos/configuration.nix
	  inputs.home-manager.nixosModules.default
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
