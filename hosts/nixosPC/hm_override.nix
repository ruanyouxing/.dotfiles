{
  lib,
  homeDir,
  ...
}: {
  home.shellAliases = {
    nixos-switch = lib.mkForce "nh os switch --ask --hostname nixosPC ${homeDir}/.dotfiles";
    nixos-boot = lib.mkForce "nh os boot --ask --hostname nixosPC ${homeDir}/.dotfiles";
    nixos-test = lib.mkForce "nh os test --ask --hostname nixosPC ${homeDir}/.dotfiles";
  };
}
