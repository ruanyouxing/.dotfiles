{
  security = {
    sudo.enable = false;
    doas = {
      enable  =true;
      extraRules = [
        {
          users = ["hungz"];
          keepEnv = true;
          noPass = true;
        }
      ];
    };
    pam.services.hyprlock = { };
  };
}
