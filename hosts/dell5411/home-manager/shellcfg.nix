{
  lib,
  homeDir,
  ...
}: {
  home.shellAliases = {
    nixos-switch = lib.mkForce "nh os switch --ask --hostname dell5411 ${homeDir}/.dotfiles";
    nixos-boot = lib.mkForce "nh os boot --ask --hostname dell5411 ${homeDir}/.dotfiles";
    nixos-test = lib.mkForce "nh os test --ask --hostname dell5411 ${homeDir}/.dotfiles";
  };
}
