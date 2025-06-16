{
  description = "ruanyouxing flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote.url = "github:nix-community/lanzaboote";
    hyprland.url = "github:hyprwm/Hyprland";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    naersk.url = "github:nmattia/naersk";
  };
  outputs = {
    nixpkgs,
    home-manager,
    lanzaboote,
    naersk,
    ...
  } @ inputs: let
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
  };
}
