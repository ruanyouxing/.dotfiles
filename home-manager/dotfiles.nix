let
  configDir = ../.config;
  configFiles = builtins.readDir configDir;
  configSymlinks =
    builtins.mapAttrs (name: _type: {
      source = "${configDir}/${name}";
    })
    configFiles;
  homeFileAttrs = builtins.listToAttrs (
    builtins.map (name: {
      name = ".config/${name}";
      value = configSymlinks.${name};
    }) (builtins.attrNames configSymlinks)
  );
in {
  home.file = homeFileAttrs;
}
