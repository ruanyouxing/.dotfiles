{pkgs, ...}: {
  networking.hostName = "veritas";
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    # gc = {
    #   automatic = true;
    #   dates = "weekly";
    #   options = "--delete-older-than 7d";
    # };
  };
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 5";
      flake = "/home/hungz/.dotfiles";
    };
  };
  system = {
    autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";
    stateVersion = "25.05";
  };
}
