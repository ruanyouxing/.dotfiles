{
  pkgs,
  inputs,
  customLib,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
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
      "kvm"
      "adbusers"
    ];
  };
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs pkgs customLib; };
    backupFileExtension = "hm-bak";
    users = {
      "hungz" = import ../home-manager;
    };
  };
  environment.sessionVariables = {
    QT_IM_MODULE = "fcitx5";
    QT_IM_MODULES = "wayland;fcitx;ibus";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    # XMODIFIERS = "@im=fcitx5";
    GLFW_IM_MODULE = "ibus";
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
