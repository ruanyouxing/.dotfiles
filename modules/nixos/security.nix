{username, ...}: {
  security = {
    polkit.enable = true;
    sudo.extraRules = [
      {
        users = [username];
        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
    pam.services.hyprlock = {};
  };
}
