{
  pkgs,
  customLib,
  ...
}: {
  home.packages = with pkgs; [
    (rofi.override {plugins = [pkgs.rofi-emoji];})
  ];
  xdg.configFile."rofi" = {
    source = customLib.excludeNixFiles ./.;
    recursive = true;
  };
}
