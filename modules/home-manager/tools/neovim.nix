{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = [
	pkgs.luajitPackages.luarocks
	pkgs.luajit
	inputs.nvim-config.packages.${pkgs.system}.default
];
}
