{
  inputs,
  catppuccinFlavor,
  ...
}: {
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.x86_64-linux;
    in
    {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = catppuccinFlavor;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
      ];
      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
      ];
    };
}
