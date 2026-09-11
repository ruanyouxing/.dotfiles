{
  inputs,
  pkgs,
  catppuccinFlavor,
  ...
}: let
  themeContent = {
    mocha = ''
      # Catppuccin Mocha (Cool Blue Edition)
      [colors]
      background = #11111bff
      card_bg = #1e1e2eff
      card_selected = #313244ff
      text_color = #cdd6f4ff
      subtext_color = #a6adc8ff
      border_color = #c1e6ffff
      bundle_bg = #1e1e2ecc
      badge_bg = #9DC2F9ff
      badge_text_color = #11111bff
    '';
    latte = ''
      # Catppuccin Latte (Sweet Mauve Remix)
      [colors]
      background = #bcc0ccff
      card_bg = #eff1f5ff
      card_selected = #ffffffff
      text_color = #4c4f69ff
      subtext_color = #6c6f85ff
      border_color = #8839efff
      bundle_bg = #dce0e8ff
      badge_bg = #8839efff
      badge_text_color = #ffffffff
    '';
    frappe = ''
      # Catppuccin Frappé (Mint/Luminous Green Edition)
      [colors]
      background = #292c3cff
      card_bg = #303446ff
      card_selected = #414559ff
      text_color = #c6d0f5ff
      subtext_color = #838ba7ff
      border_color = #c3e88dff
      bundle_bg = #303446cc
      badge_bg = #c3e88dff
      badge_text_color = #292c3cff
    '';
  };
in {
  home.packages = [
    inputs.snappy-switcher.packages.${pkgs.system}.default
  ];

  xdg.configFile."snappy-switcher/config.ini" = {
    source = pkgs.writeText "config.ini" ''
      [general]
      mode = context
      [theme]
      name = catppuccin-${catppuccinFlavor}.ini
      [icons]
      theme = Tela-dracula
      fallback = hicolor
      show_letter_fallback = true

      [font]
      family = Iosevka Nerd Font
      weight = Bold
      title_size = 12
      icon_letter_size = 24
    '';
  };
  xdg.configFile."snappy-switcher/themes/catppuccin-${catppuccinFlavor}.ini" = {
    source = pkgs.writeText "catppuccin-${catppuccinFlavor}.ini" (
      themeContent.${catppuccinFlavor}
      or themeContent.mocha
    );
  };
}
