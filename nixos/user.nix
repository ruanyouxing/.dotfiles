{
  pkgs,
  inputs,
  customLib,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.default ];
  environment.sessionVariables.NIX_OZONE_WL = "1";
  programs.zsh.enable = true;
  users.users.hungz = {
    isNormalUser = true;
    description = "hungz";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "libvirtd"
    ];
  };
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs customLib; };
    backupFileExtension = "hm-bak";
    users = {
      "hungz" = import ../home-manager;
    };
  };
}
