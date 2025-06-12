{
  pkgs,
  inputs,
  ...
}: let
  user_dir = "/home/hungz";
in {
  imports = [inputs.home-manager.nixosModules.default];
  programs.zsh.enable = true;
  users.users.hungz = {
    isNormalUser = true;
    description = "hungz";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "audio" "libvirtd"];
  };
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = ".bak";
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
  system.userActivationScripts = {
    linkScripts.text = ''
      if [[ ! -h "${user_dir}/.local/bin" ]]; then
        ln -sf "${user_dir}/.dotfiles/scripts" "${user_dir}/.local/bin"
      fi
    '';
    linkConfigs.text = ''
      DOTSDIR=${user_dir}/.dotfiles/.config/
      CONF_DIR=${user_dir}/.config/
      cd $DOTSDIR
      for conf_files in *; do
        ln -sf "$DOTSDIR$conf_files" "$CONF_DIR$conf_files"
        if [ -L "$DOTSDIR$conf_files/$conf_files" ]; then
          unlink "$DOTSDIR$conf_files/$conf_files"
        fi
      done
      ln -sf ${user_dir}/.dotfiles/home-manager "$CONF_DIR"home-manager
      if [ -L "${user_dir}/.dotfiles/home-manager/home-manager" ]; then
        unlink ${user_dir}/.dotfiles/home-manager/home-manager
      fi
    '';
  };
}
