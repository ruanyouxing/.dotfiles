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
    bad-apple-plymouth.url = "github:ruanyouxing/bad-apple-plymouth";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      spicetify-nix,
      lanzaboote,
      naersk,
      nur,
      ...
    }@inputs:
    let
      customLib = import ./lib nixpkgs.lib;
      lib = nixpkgs.lib // customLib;
    in
    {
      inherit lib;
      nixosConfigurations = {
        nixosPC = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs customLib; };
          modules = [
            ./hosts/nixosPC
            home-manager.nixosModules.default
            lanzaboote.nixosModules.lanzaboote
            nur.modules.nixos.default
          ];
        };
        dell5411 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs customLib; };
          modules = [
            ./hosts/dell5411
            home-manager.nixosModules.default
            # lanzaboote.nixosModules.lanzaboote
            nur.modules.nixos.default
          ];
        };
      };
    };
}
