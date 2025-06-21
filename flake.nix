{
  description = "ruanyouxing dotfiles flake";
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
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };
  outputs = {
    nixpkgs,
    home-manager,
    spicetify-nix,
    lanzaboote,
    naersk,
    ...
  } @ inputs: let
    customLib = import ./lib nixpkgs.lib;
    lib = nixpkgs.lib // customLib;
  in {
    inherit lib;
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs customLib;};
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
        ];
      };
    };
  };
}
