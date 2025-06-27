{
  inputs,
  pkgs,
  ...
}:
let
  quickshell = inputs.quickshell.packages.x86_64-linux.default;
  qtDeps = with pkgs.kdePackages; [
    qtdeclarative
  ];
in
{
  home.packages = [
    quickshell
  ] ++ qtDeps;
  home.sessionVariables = {
    QMLLS_BUILD_DIRS = "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml/:${quickshell}/lib/qt-6/qml/";
    QML_IMPORT_PATH = "$PWD/src";
  };
  home.file.".config/quickshell" = {
    source = ./.;
    recursive = true;
  };
}
