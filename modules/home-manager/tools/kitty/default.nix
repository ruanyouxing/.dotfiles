{customLib, ...}: {
  programs.kitty = {
    enable = true;
  };
  xdg.configFile."kitty" = {
    source = customLib.excludeNixFiles ./.;
    recursive = true;
  };
}
