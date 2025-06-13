{pkgs, ...}: {
  programs.ncmpcpp = {
    enable = true;
    # package = pkgs.ncmpcpp.override {visualizerSupport = true;};
  };
  # Will config this later, I'm too lazy
}
