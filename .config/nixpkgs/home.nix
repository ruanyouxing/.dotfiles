{ config, pkgs, ... }:
{
  imports  = [ 
    ./packages.nix
  ];
    home = {
      username = "hungz"; 
      homeDirectory = "/home/hungz/";
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
}
