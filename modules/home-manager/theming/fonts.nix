{
  pkgs,
  extraPkgs,
  ...
}: let
  nerdfonts = with pkgs.nerd-fonts; [
    iosevka
    jetbrains-mono
  ];
  stretch-pro = extraPkgs.stretch-pro;
in {
  home.packages = with pkgs;
    [
      fira-code
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      source-han-serif
      source-han-mono
      source-han-sans
      source-code-pro
      material-icons
      material-design-icons
      montserrat
      stretch-pro
    ]
    ++ nerdfonts;
}
