{ pkgs, ... }:
{
  home.packages = with pkgs; [ brave ];
  xdg.configFile."kwalletrc".source = pkgs.writeText ".kwalletrc" ''
    [Wallet]
    Enabled=false
  '';
}
