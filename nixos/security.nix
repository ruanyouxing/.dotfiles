{
  security = {
    sudo.extraRules = [
      {
        users = [ "hungz" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
    pam.services.hyprlock = { };
  };
}
