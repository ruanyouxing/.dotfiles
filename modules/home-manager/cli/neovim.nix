{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nvim-config.packages.${pkgs.stdenv.hostPlatform.system}.nvim-dependencies
  ];
  programs.neovim = {
    enable = true;
    package = inputs.nvim-config.packages.${pkgs.stdenv.hostPlatform.system}.default;
    defaultEditor = true;
  };
}
