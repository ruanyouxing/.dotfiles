{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {self,nixpkgs,home-manager}:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in{
    hmConfig = {
      hungz = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "hungz";
        homeDirectory = "/home/hungz";
        stateVersion = "23.05";
        configuration = {
          imports = [
            ./home.nix
          ];
        };
      };
    };
  };
}
