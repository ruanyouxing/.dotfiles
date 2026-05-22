{pkgs, ...}: let
  awww-init = pkgs.writeShellScriptBin "awww-init" ''
    if pgrep -x awww-daemon  > /dev/null
    then
      awww kill
    fi
    awww-daemon
  '';
in {
  home.packages = [
    awww-init
  ];
}
