{ inputs, ... }:
let
  nvim-config = inputs.nvim-config;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim".source = nvim-config;
  home.packages = nvim-config.utils;
}
