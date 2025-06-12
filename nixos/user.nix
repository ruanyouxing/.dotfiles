{
  pkgs,
  inputs,
  ...
}:{
  imports = [inputs.home-manager.nixosModules.default];
  programs.zsh.enable = true;
  users.users.hungz = {
    isNormalUser = true;
    description = "hungz";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "audio" "libvirtd"];
  };
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = ".hm-bak";
    users = {
      "hungz" = import ../home-manager;
    };
  };
  security.rtkit.enable = true;
  security.sudo.extraRules = [
    {
      users = ["hungz"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}
