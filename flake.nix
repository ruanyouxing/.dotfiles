{
  description = "ruanyouxing dotfiles flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvim-config.url = "github:ruanyouxing/nvim";
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
    bad-apple-plymouth.url = "github:ruanyouxing/bad-apple-plymouth/test";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    home-manager,
    # lanzaboote,
    nur,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    customLib = import ./lib nixpkgs.lib;
    lib = nixpkgs.lib // customLib;
    username = "hungz";
    homeDir = "/home/${username}";
  in {
    inherit lib;

    nixosConfigurations = {
      nixosPC = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs customLib username homeDir;};
        modules = [
          ./hosts/nixosPC
          home-manager.nixosModules.default
          # lanzaboote.nixosModules.lanzaboote
          nur.modules.nixos.default
        ];
      };
      dell5411 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs customLib username homeDir;};
        modules = [
          ./hosts/dell5411
          home-manager.nixosModules.default
          nur.modules.nixos.default
        ];
      };
    };
    homeConfigurations = {
      "homeConfig" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs customLib username homeDir;};
        modules = [
          ./modules/home-manager/default.nix
        ];
      };
    };
  };
}
