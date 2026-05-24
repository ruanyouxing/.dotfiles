{customLib, ...}: {
  imports = customLib.importModules {
    dir = ./.;
  };
}
