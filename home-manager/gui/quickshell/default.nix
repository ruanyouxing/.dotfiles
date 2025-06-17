{
  inputs,
  config,
  ...
}: {
  home.packages = [
    inputs.quickshell.packages.x86_64-linux.default
  ];
  xdg.configFile."quickshell/shell.qml".source = (toString ./shell.qml);
}
