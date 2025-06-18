{
  inputs,
  pkgs,
  customLib,
  ...
}: let
  quickshell = inputs.quickshell.packages.x86_64-linux.default;
  qtDeps = with pkgs.kdePackages; [
    qtdeclarative
  ];
  inherit (customLib.genSymLinks) genConfLinks;
in {
  home.packages =
    [
      quickshell
    ]
    ++ qtDeps;
  home.sessionVariables = {
    QMLLS_BUILD_DIRS = "${pkgs.kdePackages.qtdeclarative}/lib/qt-6/qml/:${quickshell}/lib/qt-6/qml/";
    QML_IMPORT_PATH = "$PWD/src";
  };
  home.file = genConfLinks [../.] {ignoredGlobs = [".nix" ".ini"];};
}
