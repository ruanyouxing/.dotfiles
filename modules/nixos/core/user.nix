{
  pkgs,
  inputs,
  customLib,
  username,
  homeDir,
  catppuccinFlavor,
  catppuccinAccent,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "libvirtd"
      "kvm"
      "adbusers"
    ];
  };
  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs pkgs customLib username homeDir catppuccinFlavor catppuccinAccent;};
    backupFileExtension = "hm-bak";
    users = {
      ${username} = inputs.self + "/modules/home-manager/";
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
