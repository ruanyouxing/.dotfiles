{lib, ...}: {
  services.gammastep.enable = lib.mkForce false;
}
