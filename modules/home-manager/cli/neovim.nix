{
  inputs,
  pkgs,
  lib,
  ...
}: let
  system = pkgs.stdenv.hostPlatform.system;
  allDeps = inputs.nvim-config.legacyPackages.${system}.nvimDependencies;
  exclude = ["opencode" "lazygit"];
  filteredDeps = builtins.filter (pkg: !(builtins.elem (lib.getName pkg) exclude)) allDeps;
in {
  home.packages = [
    (pkgs.buildEnv {
      name = "nvim-dependencies";
      paths = filteredDeps;
    })
  ];
  programs.neovim = {
    enable = true;
    package = inputs.nvim-config.packages.${system}.default;
    defaultEditor = true;
  };
  programs.lazygit = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.opencode.enable = true;
}
