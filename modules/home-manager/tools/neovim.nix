{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nvim-config.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.nvim-config.packages.${pkgs.stdenv.hostPlatform.system}.nvim-dependencies
  ];
}
